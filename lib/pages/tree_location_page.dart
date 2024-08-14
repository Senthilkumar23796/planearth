import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/provider/validator_provider.dart';
import 'package:planearth/widgets/tree_text_field.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/home_text.dart';
import 'upload_image_page.dart';

enum ButtonState { active, inactive, damaged }

class TreeLocationPage extends StatefulWidget {
  const TreeLocationPage({super.key});

  @override
  State<TreeLocationPage> createState() => _TreeLocationPageState();
}

class _TreeLocationPageState extends State<TreeLocationPage> {
  final formKey = GlobalKey<FormState>();
  final validator = ValidatorProvider();
  TextEditingController latiController = TextEditingController();
  TextEditingController longiController = TextEditingController();

  //final List<String> statusList = ["Active", "InActive", "Damaged"];
  //bool _flag = true;
  ButtonState _selectState = ButtonState.active;

  // final Completer<GoogleMapController> _controller = Completer();
  //
  // static const CameraPosition initialPosition = CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.0);
  //
  // static const CameraPosition targetPosition = CameraPosition(target: LatLng(37.43296265331129, -122.08832357078792), zoom: 14.0, bearing: 19,Future<Object> tilt: 60);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location services are disabled.')),
        );
        return;
      }

      // Check location permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location permissions are denied.')),
          );
          return;
        }
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Update the text fields with the current position
      setState(() {
        latiController.text = position.latitude.toString();
        longiController.text = position.longitude.toString();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching location: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: height * 0.08,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "assets/images/back.svg",
            width: 24.0,
            height: 24.0,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: HomeText(
                    sizeFont: 16.0,
                    colorFont: Colors.black,
                    value: "Add Location",
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                  child: SizedBox(
                    width: width * 0.8,
                    child:  StepProgressIndicator(
                      totalSteps: 3,
                      direction: Axis.horizontal,
                      currentStep: 2,
                      selectedColor: Colors.teal,
                      unselectedColor: Colors.grey.withOpacity(0.4),
                      size: 8.0,
                      roundedEdges: Radius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                    color: circleBgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Image(
                    image: AssetImage("assets/images/location.png"),
                  ),
                  // child: GoogleMap(
                  //   initialCameraPosition: initialPosition,
                  //   mapType: MapType.satellite,
                  //   onMapCreated: (GoogleMapController controller) {
                  //     _controller.complete(controller);
                  //   },
                  // ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const HomeText(
                  sizeFont: 14.0,
                  colorFont: Colors.black,
                  value: "Latitude",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TreeTextField(
                  controller: latiController,
                  enabled: false,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const HomeText(
                  sizeFont: 14.0,
                  colorFont: Colors.black,
                  value: "Longitude",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TreeTextField(
                  controller: latiController,
                  enabled: false,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const HomeText(
                  sizeFont: 14.0,
                  colorFont: Colors.black,
                  value: "Status",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectState = ButtonState.active;
                        });
                      },
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.25,
                        decoration: BoxDecoration(
                            color: _selectState == ButtonState.active
                                ? Colors.teal.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: _selectState == ButtonState.active
                                  ? Colors.teal
                                  : Colors.grey,
                            )),
                        child: Center(
                          child: HomeText(
                            sizeFont: 12.0,
                            colorFont: _selectState == ButtonState.active
                                ? Colors.teal
                                : Colors.black,
                            value: "Active",
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectState = ButtonState.inactive;
                        });
                      },
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.25,
                        decoration: BoxDecoration(
                            color: _selectState == ButtonState.inactive
                                ? Colors.teal.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: _selectState == ButtonState.inactive
                                  ? Colors.teal
                                  : Colors.grey,
                            )),
                        child: Center(
                          child: HomeText(
                            sizeFont: 12.0,
                            colorFont: _selectState == ButtonState.inactive
                                ? Colors.teal
                                : Colors.black,
                            value: "InActive",
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectState = ButtonState.damaged;
                        });
                      },
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.25,
                        decoration: BoxDecoration(
                          color: _selectState == ButtonState.damaged
                              ? Colors.teal.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: _selectState == ButtonState.damaged
                                ? Colors.teal
                                : Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: HomeText(
                            sizeFont: 12.0,
                            colorFont: _selectState == ButtonState.damaged
                                ? Colors.teal
                                : Colors.black,
                            value: "Damaged",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadImagePage(),
                        ),
                      );
                    } else {}
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * 0.06,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.teal,
                      ),
                      alignment: Alignment.center,
                      child: const HomeText(
                        sizeFont: 14.0,
                        colorFont: Colors.white,
                        value: "NEXT",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// getContainerColor(String value) {
//   if (value == "Active") {
//     return Colors.teal.withOpacity(0.2);
//   } else if (value == "InActive") {
//     return Colors.amber.withOpacity(0.2);
//   } else {
//     return Colors.red.withOpacity(0.2);
//   }
// }
//
// getTextColor(String value) {
//   if (value == "Active") {
//     return Colors.teal;
//   } else if (value == "InActive") {
//     return Colors.amber;
//   } else {
//     return Colors.red;
//   }
// }

// Future<void> goToLake() async {
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
// }
}
