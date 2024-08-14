import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/widgets/home_text.dart';

import 'add_new_tree.dart';

class TreeList extends StatefulWidget {
  const TreeList({super.key});

  @override
  State<TreeList> createState() => _TreeListState();
}

class _TreeListState extends State<TreeList> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final List<String> treeImage = [
      "assets/images/treesamples.png",
      "assets/images/treesamples.png",
      "assets/images/treesamples.png",
      "assets/images/treesamples.png",
      "assets/images/treesamples.png",
    ];
    final List<String> activeList = [
      "Active",
      "InActive",
      "Active",
      "InActive",
      "Active",
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
          value: "Kerala",
        ),
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 2.8,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: FaIcon(
              FontAwesomeIcons.sliders,
              size: 18.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //height: height * 0.16,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [Colors.teal.withOpacity(0.9), Colors.teal],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 22.0,
                          backgroundColor: circleBgColor,
                          child: Image(
                            image: AssetImage("assets/images/location.png"),
                            height: height * 0.06,
                            width: width * 0.06,
                          ),
                        ),
                        title: const HomeText(
                          sizeFont: 12.0,
                          colorFont: Colors.white,
                          value:
                              "Gavi-Moozhiayar Road, Chittar-seethathodu, Kerala 689699",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HomeText(
                                  sizeFont: 14.0,
                                  colorFont: Colors.white.withOpacity(0.8),
                                  value: "Total Trees",
                                ),
                                const HomeText(
                                  sizeFont: 18.0,
                                  colorFont: Colors.white,
                                  value: "12",
                                )
                              ],
                            ),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HomeText(
                                  sizeFont: 14.0,
                                  colorFont: Colors.white.withOpacity(0.8),
                                  value: "RFID",
                                ),
                                const HomeText(
                                  sizeFont: 18.0,
                                  colorFont: Colors.white,
                                  value: "140",
                                )
                              ],
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
                                height: height * 0.04,
                                width: width * 0.22,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                child: const Center(
                                  child: HomeText(
                                    sizeFont: 12.0,
                                    colorFont: Colors.white,
                                    value: "+ Add New",
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const HomeText(
                sizeFont: 16.0,
                colorFont: Colors.black,
                value: "5 Lists",
              ),
              const SizedBox(
                height: 15.0,
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final value = activeList[index];
                  final textColor = getTextColor(value);
                  return Container(
                    height: height * 0.2,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: height,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  //color: Colors.teal,
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: AssetImage(treeImage[index]),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10.0,
                                left: 30.0,
                                child: Container(
                                  height: height * 0.02,
                                  width: width * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: HomeText(
                                        sizeFont: 10.0,
                                        colorFont: textColor,
                                        value: value),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const HomeText(
                                    sizeFont: 12.0,
                                    colorFont: Colors.black54,
                                    value: "Tree ID No",
                                  ),
                                  SizedBox(
                                    width: width * 0.3,
                                  ),
                                  const HomeText(
                                    sizeFont: 14.0,
                                    value: "AB123",
                                    colorFont: Colors.black,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  const HomeText(
                                    sizeFont: 12.0,
                                    colorFont: Colors.black54,
                                    value: "Tag ID",
                                  ),
                                  SizedBox(
                                    width: width * 0.23,
                                  ),
                                  const HomeText(
                                    sizeFont: 14.0,
                                    value: "37DHJBVCF3",
                                    colorFont: Colors.black,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  const HomeText(
                                    sizeFont: 12.0,
                                    colorFont: Colors.black54,
                                    value: "Species & Trees",
                                  ),
                                  SizedBox(
                                    width: width * 0.1,
                                  ),
                                  Row(
                                    children: [
                                      const HomeText(
                                        sizeFont: 14.0,
                                        value: "AB Planta",
                                        colorFont: Colors.black,
                                      ),
                                      CircleAvatar(
                                        radius: 8.0,
                                        backgroundColor:
                                            Colors.teal.withOpacity(0.2),
                                        child: HomeText(
                                          sizeFont: 12.0,
                                          colorFont: textTealColor,
                                          value: "5",
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.pen,
                                      size: 12.0,
                                      color: editIconColor,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    HomeText(
                                        sizeFont: 10.0,
                                        colorFont: editIconColor,
                                        value: "Edit")
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTextColor(String value) {
    if (value == "Active") {
      return Colors.teal;
    } else {
      return Colors.red;
    }
  }
}
