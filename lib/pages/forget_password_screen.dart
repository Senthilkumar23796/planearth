import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/pages/login_screen.dart';
import 'package:planearth/provider/validator_provider.dart';
import 'package:provider/provider.dart';

import '../Constants/circle_container.dart';
import '../widgets/model_text.dart';
import '../widgets/model_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final validateProvider = ValidatorProvider();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: width,
            child: SvgPicture.asset(
              "assets/images/flowerlogin.svg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: height * 0.15, // Adjust as needed
            left: 0,
            right: 0,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                image: AssetImage("assets/images/plannew.png"),
                height: 150.0,
                width: 150.0,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: height * 0.53,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const ModelText(
                      sizeFont: 20.0,
                      colorFont: Colors.white,
                      value: "Change Password Now",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const ModelText(
                      sizeFont: 14.0,
                      colorFont: Colors.white,
                      value: "Please enter the details below and continue",
                    ),
                    Form(
                      key: formkey,
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Column(
                          children: [
                            ModelTextField(
                              controller: usernameController,
                              hintText: "Enter Your Email ID",
                              inputType: TextInputType.emailAddress,
                              validator: (value) =>
                                  validateProvider.emailValidator(value),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Consumer<ValidatorProvider>(
                                builder: (builder, notifier, child) {
                              return ModelTextField(
                                controller: passwordController,
                                hintText: "Enter Your Password",
                                inputType: TextInputType.text,
                                isVisble: !notifier.isVisible,
                                validator: (value) =>
                                    validateProvider.passwordValidator(value),
                                prefixIcon: const Icon(
                                  Icons.lock_open,
                                  color: Colors.white,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      notifier.showPassword();
                                    },
                                    icon: Icon(notifier.isVisible?
                                      Icons.visibility:Icons.visibility_off,
                                      color: Colors.white,
                                    )),
                              );
                            }),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Consumer<ValidatorProvider>(
                                builder: (context, notifier, child) {
                              return ModelTextField(
                                controller: confirmpasswordController,
                                hintText: "Enter Your Confirm Password",
                                inputType: TextInputType.text,
                                isVisble: !notifier.isVisible,
                                prefixIcon: const Icon(
                                  Icons.lock_open,
                                  color: Colors.white,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      notifier.showPassword();
                                    },
                                    icon: Icon(notifier.isVisible?
                                      Icons.visibility:Icons.visibility_off,
                                      color: Colors.white,
                                    )),
                              );
                            }),
                            const SizedBox(
                              height: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                if(formkey.currentState!.validate()){

                                }else{}
                              },
                              child: Container(
                                height: height * 0.05,
                                width: width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.alexandria(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: buttonText,
                                  ),
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.inter(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: "You Know your Password ?  ",
                                    style: GoogleFonts.inter(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                      text: " Login Now !",
                                      style: GoogleFonts.inter(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: richText,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap=(){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const LoginScreen(),
                                          ),
                                        );
                                      }
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
