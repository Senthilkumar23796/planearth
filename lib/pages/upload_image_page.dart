import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planearth/pages/add_new_tree.dart';
import 'package:planearth/pages/tree_list.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../constants/colors.dart';
import '../widgets/bottom_dim_text.dart';
import '../widgets/home_text.dart';
import '../widgets/model_text.dart';

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({super.key});

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  List<File?> images = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Center(
              child: HomeText(
                sizeFont: 16.0,
                colorFont: Colors.black,
                value: "Upload Tree Photos",
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Center(
              child: SizedBox(
                width: width * 0.8,
                child: StepProgressIndicator(
                  totalSteps: 3,
                  direction: Axis.horizontal,
                  currentStep: 3,
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
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return _buildImageContainer(index, height, width);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                openBottomSheet();
              },
              child: Container(
                height: height * 0.05,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: HomeText(
                    sizeFont: 14.0,
                    colorFont: Colors.white,
                    value: "UPLOAD",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(int index, double height, double width) {
    return GestureDetector(
      onTap: () => alertDialog(index),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: height * 0.18,
              width: width * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1.5),
              ),
              child: images[index] != null
                  ? Image.file(images[index]!, fit: BoxFit.cover)
                  : Center(
                    child: SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: SvgPicture.asset("assets/images/camera.svg"),
                      ),
                  ),
            ),
          ),
          if (images[index] != null)
            Positioned(
              top: -1,
              right: -1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    images[index] = null;
                  });
                },
                child: const CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.red,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> alertDialog(int index) {
    return showDialog(
      context: context,
      builder: (context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Dialog(
          backgroundColor: Colors.white.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height: height * 0.2,
            width: width * 0.15,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickImage(ImageSource.camera, index);
                    Navigator.pop(context);
                  },
                  title: const HomeText(
                      sizeFont: 16.0, colorFont: Colors.black, value: "Camera"),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 24.0,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
                //const Divider(color: Colors.teal,thickness: 2.0,),
                const SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  onTap: () {
                    pickImage(ImageSource.gallery, index);
                    Navigator.pop(context);
                  },
                  title: const HomeText(
                      sizeFont: 16.0,
                      colorFont: Colors.black,
                      value: "Gallery"),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 24.0,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.folder,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future pickImage(ImageSource source, int index) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        images[index] = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to Pick Image:$e");
    }
  }

  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: SvgPicture.asset("assets/images/addedsuccessfully.svg"),
                ),
                const ModelText(
                  sizeFont: 20.0,
                  colorFont: Colors.black,
                  value: "Added Successfully",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const BottomDimText(
                  sizeFont: 14.0,
                  colorFont: dimText,
                  value:
                      "Place RFID Tag & Enter Tree Data, know the your planted tree data and importance of this tree",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNewTree(),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: HomeText(
                        sizeFont: 14.0,
                        colorFont: Colors.white,
                        value: "Add more",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TreeList(),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.teal)),
                    child: const Center(
                      child: HomeText(
                        sizeFont: 14.0,
                        colorFont: Colors.teal,
                        value: "Go to lists",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
