import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/pages/bottom_bar.dart';
import 'package:planearth/widgets/home_text.dart';

import 'location_page.dart';
import 'nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final List<String> addressList = [
      "Gavi-Moozhiayar Road,chittarseethathodu,Kerala 689699",
      "Gavi-Moozhiayar Road,chittarseethathodu,Kerala 689699",
    ];
    final List<String> dueList = [
      "Upcoming",
      "Overdue",
    ];
    final appBarHeight = height * 0.26;
    final toolbarHeight = height * 0.2;
    final imageSize = height * 0.06;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          primary: false,
          centerTitle: true,
          //leadingWidth: width * 0.15,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: SvgPicture.asset("assets/images/menu.svg"),
            ),
          ),
          title: Container(
            height: imageSize,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
            ),
            child: Image.asset(
              "assets/images/plannew.png",
            ),
          ),
          toolbarHeight: toolbarHeight,
          //automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/images/notification.svg",
                  height: 35.0,
                ),
              ),
            )
          ],
          flexibleSpace: SvgPicture.asset(
            "assets/images/homebg.svg",
            fit: BoxFit.cover,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(height),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                        //child: SvgPicture.asset("assets/images/profile.svg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: 15.3,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            children: [
                              const TextSpan(text: "Welcome "),
                              TextSpan(
                                text: "Anu Karthick",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.3,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            "assets/images/lastlogin.svg",
                          ),
                        ),
                        // const Icon(
                        //   Icons.access_time_outlined,
                        //   color: Colors.black54,
                        //   size: 25.0,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                              children: [
                                const TextSpan(text: "Last login "),
                                TextSpan(
                                  text: DateFormat('EEE, MMM y')
                                      .format(DateTime.now()),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: dateColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeText(
                sizeFont: 14.0, colorFont: Colors.black, value: "Assigned"),
            const SizedBox(
              height: 20.0,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: addressList.length,
              itemBuilder: (context, index) {
                final value = dueList[index];
                final containerColor = getContainerColor(value);
                final textColor = getTextColor(value);
                return Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey, width: 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: height * 0.07,
                              width: width * 0.16,
                              decoration: BoxDecoration(
                                //color: Colors.teal,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.teal,
                                      child: const Center(
                                        child: HomeText(
                                          colorFont: Colors.white,
                                          sizeFont: 9.94,
                                          value: "AUG",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: width,
                                      color:
                                          Colors.tealAccent.withOpacity(0.3),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          HomeText(
                                              sizeFont: 9.94,
                                              colorFont: cardDateColor,
                                              value: "12"),
                                          HomeText(
                                              sizeFont: 9.94,
                                              colorFont: Colors.black,
                                              value: "MON"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.5,
                              height: height * 0.07,
                              child: Text(
                                addressList[index],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.08,
                              height: height * 0.05,
                              child: SvgPicture.asset(
                                "assets/images/location.svg",
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: height * 0.02,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                  child: HomeText(
                                value: value,
                                colorFont: textColor,
                                sizeFont: 10.0,
                              )),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const HomeText(
                                sizeFont: 10.0,
                                colorFont: Colors.black54,
                                value: "4 Days to go")
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeText(
                    sizeFont: 14.0,
                    colorFont: Colors.black,
                    value: "Recent activity",
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: height * 0.19,
                    width: width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: addressList.length,
                      itemBuilder: (context, index) {
                        //final value = dueList[index];
                        // final containerColor = getContainerColor(value);
                        // final textColor = getTextColor(value);
                        return Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          //fffheight: height * 0.08,
                          width: width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.1,
                                      height: height * 0.05,
                                      child: SvgPicture.asset(
                                        "assets/images/location.svg",
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Flexible(
                                      child: HomeText(
                                        sizeFont: 12.0,
                                        colorFont:
                                            Colors.black.withOpacity(0.7),
                                        value: addressList[index],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1.0,
                                color: Colors.grey,
                              ),
                              ListTile(
                                leading: SizedBox(
                                  width: width * 0.05,
                                  height: height * 0.05,
                                  child: SvgPicture.asset(
                                    "assets/images/tagscanned.svg",
                                  ),
                                ),
                                title: HomeText(
                                  value: "Tags Scanned",
                                  colorFont: Colors.black.withOpacity(0.7),
                                  sizeFont: 14.0,
                                ),
                                trailing: const HomeText(
                                  sizeFont: 14.0,
                                  colorFont: Colors.black,
                                  value: "1000",
                                ),
                                minTileHeight: 12.0,
                              ),
                              ListTile(
                                leading: SizedBox(
                                  width: width * 0.05,
                                  height: height * 0.05,
                                  child: SvgPicture.asset(
                                    "assets/images/treecount.svg",
                                  ),
                                ),
                                title: HomeText(
                                  value: "Trees Count",
                                  colorFont: Colors.black.withOpacity(0.7),
                                  sizeFont: 14.0,
                                ),
                                trailing: const HomeText(
                                  sizeFont: 14.0,
                                  colorFont: Colors.black,
                                  value: "2500",
                                ),
                                minTileHeight: 12.0,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LocationPage(),
            ),
          );
        },
        backgroundColor: Colors.teal,
        child: const FaIcon(
          FontAwesomeIcons.forward,
          color: Colors.white,
        ),
      ),
    );
  }

  getContainerColor(String value) {
    if (value == "Upcoming") {
      return Colors.teal.withOpacity(0.2);
    } else {
      return Colors.red.withOpacity(0.2);
    }
  }

  getTextColor(String value) {
    if (value == "Upcoming") {
      return Colors.teal;
    } else {
      return Colors.red;
    }
  }
}
