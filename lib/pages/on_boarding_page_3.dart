import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/widgets/model_text.dart';
import '../Constants/circle_container.dart';
import '../widgets/bottom_dim_text.dart';

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.teal,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
                top: -250,
                //left: -150,
                child: CircleContainer(
                  backgroundColor: Colors.white.withOpacity(0.2),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.only(top: height*0.01),
                      child: SizedBox(
                        height: height * 0.55,
                        width: width * 0.9,
                        child: SvgPicture.asset("assets/images/tracktrees.svg"),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.40,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 40.0,
                      left: 10.0,
                      right: 10.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ModelText(
                          sizeFont: 20.0,
                          colorFont: mainText,
                          value: "Track the trees",
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        BottomDimText(
                          sizeFont: 14.0,
                          colorFont: dimText,
                          value:
                              "Place RFID Tag & Enter Tree Data, know the your planted tree data and importance of this tree",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
