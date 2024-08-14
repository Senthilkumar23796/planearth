import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/pages/on_boarding_page_1.dart';
import 'package:planearth/pages/on_boarding_page_2.dart';
import 'package:planearth/widgets/bottom_dim_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_screen.dart';
import 'on_boarding_page_3.dart';

class SmoothIndicator extends StatefulWidget {
  const SmoothIndicator({super.key});

  @override
  State<SmoothIndicator> createState() => _SmoothIndicatorState();
}

class _SmoothIndicatorState extends State<SmoothIndicator> {
  final PageController _controller = PageController();

  void _nextPage() {
    if (_controller.page == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                OnBoardingPage1(),
                OnBoardingPage2(),
                OnBoardingPage3(),
              ],
            ),
            Positioned(
              bottom: 30.0,
              left: 0,
              right: 0,
              //alignment: const Alignment(0, 0.9),
              //padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect:WormEffect(
                        dotColor: Colors.teal.withOpacity(0.5),
                        activeDotColor: Colors.teal,
                        dotHeight: 15.0,
                        dotWidth: 15.0,
                        spacing: 30.0,
                      ),
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: _skip,
                          child: Text(
                            "Skip",
                            style: GoogleFonts.inter(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: dimText,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 24.0,
                          child: IconButton(
                            onPressed: _nextPage,
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
