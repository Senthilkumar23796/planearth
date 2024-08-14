import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/pages/add_new_tree.dart';
import 'package:planearth/pages/tree_list.dart';
import 'package:planearth/widgets/home_text.dart';
import 'package:planearth/widgets/inventory_text.dart';

import 'scan_page.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
            width: 24.0,
            height: 24.0,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: const HomeText(
          sizeFont: 16.0,
          colorFont: Colors.black,
          value: "Location",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanPage(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_right_alt))
        ],
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 2.8,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 55.0,
                  backgroundColor: circleBgColor,
                  child: Image(
                    image: AssetImage("assets/images/location.png"),
                    width: 37.82,
                    height: 37.82,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: width * 0.7,
                child: InventoryText(
                  sizeFont: 14.0,
                  colorFont: Colors.black.withOpacity(0.5),
                  value:
                      "Gavi-Moozhiayar Road, Chittar-seethathodu, Kerala 689699",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: height * 0.02,
                width: width * 0.15,
                decoration: BoxDecoration(
                  color: btnTealColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: const Center(
                  child: InventoryText(
                      sizeFont: 10.0, colorFont: Colors.white, value: "Active"),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: height * 0.25,
                      width: width * 0.25,
                      color: Colors.white,
                      child: const Column(
                        children: [
                          // Center(
                          //   child: SizedBox(
                          //     height: 20.0,
                          //     width: 20.0,
                          //     child: SvgPicture.asset(
                          //       "assets/images/rfidicon.svg",
                          //     ),
                          //   ),
                          // ),
                          Image(
                            image: AssetImage(
                              "assets/images/iquestion.png",
                            ),
                            height: 90.0,
                            width: 90.0,
                          ),
                          const HomeText(
                              sizeFont: 32.0,
                              colorFont: Colors.black,
                              value: "50"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const HomeText(
                              sizeFont: 20.0,
                              colorFont: Colors.black,
                              value: "RFIDS")
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 0.8,
                      endIndent: 30.0,
                    ),
                    Container(
                      height: height * 0.25,
                      width: width * 0.25,
                      color: Colors.white,
                      child:const Column(
                        children: [
                          // Center(
                          //   child: SizedBox(
                          //     height: 20.0,
                          //     width: 20.0,
                          //     child: SvgPicture.asset(
                          //       "assets/images/treeicon.svg",
                          //     ),
                          //   ),
                          // ),
                          Image(
                            image: AssetImage(
                              "assets/images/treeq.png",
                            ),
                            height: 90.0,
                            width: 90.0,
                          ),
                          const HomeText(
                              sizeFont: 32.0,
                              colorFont: Colors.black,
                              value: "3150"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const HomeText(
                              sizeFont: 20.0,
                              colorFont: Colors.black,
                              value: "TREES")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Colors.teal.withOpacity(0.2),
                  child: const FaIcon(
                    FontAwesomeIcons.user,
                    color: personIconColor,
                    size: 18.0,
                  ),
                ),
                title: const HomeText(
                    sizeFont: 14.0,
                    colorFont: Colors.black,
                    value: "Updated On"),
                subtitle: const HomeText(
                    sizeFont: 14.0,
                    colorFont: Colors.black54,
                    value: "Mon 8, Jun"),
                trailing: const FaIcon(FontAwesomeIcons.angleRight),
              ),
              const Divider(),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TreeList(),
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.09,
                      width: width * 0.42,
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: SvgPicture.asset(
                                "assets/images/viewlist.svg",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const HomeText(
                              sizeFont: 14.0,
                              colorFont: textTealColor,
                              value: "View List")
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewTree(),
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.09,
                      width: width * 0.42,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: SvgPicture.asset(
                                "assets/images/addlist.svg",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const HomeText(
                            sizeFont: 14.0,
                            colorFont: Colors.white,
                            value: "Add List",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
