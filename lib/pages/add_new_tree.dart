import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planearth/provider/validator_provider.dart';
import 'package:planearth/widgets/home_text.dart';
import 'package:planearth/widgets/tree_text_field.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'tree_location_page.dart';

class AddNewTree extends StatefulWidget {
  const AddNewTree({super.key});

  @override
  State<AddNewTree> createState() => _AddNewTreeState();
}

class _AddNewTreeState extends State<AddNewTree> {
  final formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  TextEditingController rfidController = TextEditingController();
  TextEditingController speciesController = TextEditingController();
  TextEditingController noofTreeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var _dropValue = "0";

  final validateProvider = ValidatorProvider();

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
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: HomeText(
                    sizeFont: 16.0,
                    colorFont: Colors.black,
                    value: "Add Tree",
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
                      currentStep: 1,
                      selectedColor: Colors.teal,
                      unselectedColor: Colors.grey.withOpacity(0.4),
                      size: 8.0,
                      roundedEdges: Radius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                const HomeText(
                  sizeFont: 14.0,
                  colorFont: Colors.black,
                  value: "Tree Identification No",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TreeTextField(
                  controller: idController,
                  validator: (value) => validateProvider.validator(
                    value,
                    "Value Must be required",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const HomeText(
                  sizeFont: 14.0,
                  colorFont: Colors.black,
                  value: "RFID no",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TreeTextField(
                  controller: rfidController,
                  suffixIcon:InkWell(
                    onTap: (){
                      //Click a Icon to scan and get a RFID number

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 10.0,
                        child: SvgPicture.asset("assets/images/scanner.svg"),
                      ),
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.document_scanner_outlined,
                  //     color: Colors.teal,
                  //   ),
                  
                  validator: (value) => validateProvider.validator(
                    value,
                    "Value Must be required",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const HomeText(
                  sizeFont: 14.0,
                  colorFont: Colors.black,
                  value: "Species",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                // TreeTextField(
                //   controller: speciesController,
                //   validator: (value) => validateProvider.validator(
                //     value,
                //     "Value Must be required",
                //   ),
                // ),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
                      ),
                    ),
                    iconSize: 30.0,

                    value: _dropValue,
                    items: const [
                      DropdownMenuItem(
                        value: "0",
                        child: HomeText(
                          sizeFont: 14.0,
                          colorFont: Colors.black,
                          value: "Select Species",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "1",
                        child: HomeText(
                          sizeFont: 14.0,
                          colorFont: Colors.black,
                          value: "Tree 1",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: HomeText(
                          sizeFont: 14.0,
                          colorFont: Colors.black,
                          value: "Tree 2",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: HomeText(
                          sizeFont: 14.0,
                          colorFont: Colors.black,
                          value: "Tree 3",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: HomeText(
                          sizeFont: 14.0,
                          colorFont: Colors.black,
                          value: "Tree 4",
                        ),
                      ),
                    ],
                    onChanged: (v) {}),
                const SizedBox(
                  height: 20.0,
                ),
                const HomeText(
                  sizeFont: 14.0,
                  colorFont: Colors.black,
                  value: "No of Trees",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TreeTextField(
                  controller: noofTreeController,
                  inputType: TextInputType.number,
                  //inputFormat: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => validateProvider.validator(
                    value,
                    "Value Must be required",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const HomeText(
                  sizeFont: 14.0,
                  colorFont: Colors.black,
                  value: "Description",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TreeTextField(
                  controller: descriptionController,
                  maxiLines: 3,
                  inputType: TextInputType.text,
                  validator: (value) => validateProvider.validator(
                    value,
                    "Value Must be required",
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TreeLocationPage(),
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
}
