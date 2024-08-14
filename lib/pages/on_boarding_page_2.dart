import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/widgets/bottom_dim_text.dart';
import 'package:planearth/widgets/model_text.dart';
import '../Constants/circle_container.dart';

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({super.key});

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
                top: -150,
                right: -170,
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
                      padding: const EdgeInsets.only(top: 70.0),
                      child: SizedBox(
                        height: height * 0.45,
                        width: width * 0.8,
                        child: SvgPicture.asset("assets/images/scanupdate.svg"),
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
                  child:const Padding(
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
                          value: "Scan and Update",
                        ),
                         SizedBox(
                          height: 10.0,
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
