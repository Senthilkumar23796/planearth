import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/widgets/home_text.dart';

import 'inventory_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  int? isSelected;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final List<String> locatioList = [
      "Location 1",
      "Location 2",
      "Location 3",
      "Location 4",
      "Location 5",
      "Location 6",
      "Location 7",
      "Location 8",
      "Location 9",
      "Location 10"
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        toolbarHeight: height * 0.08,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "assets/images/back.svg",
            height: 4.67,
            width: 9.33,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: const HomeText(
          sizeFont: 16.0,
          colorFont: Colors.black,
          value: "Choose Location",
        ),
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 2.8,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: locatioList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(
                    5.0,
                  ),
                  child: ListTile(
                    splashColor: Colors.white,
                    onTap: () {
                      setState(() {
                        isSelected = index;
                      });
                    },
                    leading: const CircleAvatar(
                      backgroundColor: circleBgColor,
                      radius: 22.0,
                      child: Image(
                        image: AssetImage("assets/images/location.png"),
                        height: 14.71,
                        width: 14.71,
                      ),
                    ),
                    title: HomeText(
                        sizeFont: 16.0,
                        colorFont: locationTxtColor,
                        value: locatioList[index]),
                    trailing: isSelected == index
                        ? const FaIcon(
                            FontAwesomeIcons.check,
                            color: Colors.blue,
                          )
                        : null,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 1.5,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InventoryPage(),
                  ),
                );
              },
              child: Container(
                height: height * 0.05,
                width: width,
                decoration: BoxDecoration(
                  color: textTealColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Center(
                  child: HomeText(
                    value: "NEXT",
                    colorFont: Colors.white,
                    sizeFont: 14.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
