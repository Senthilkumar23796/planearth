import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planearth/constants/colors.dart';
import 'package:planearth/pages/forget_password_screen.dart';
import 'package:planearth/provider/validator_provider.dart';
import 'package:planearth/widgets/model_text.dart';
import 'package:provider/provider.dart';
import '../widgets/model_text_field.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final validateProvider = ValidatorProvider();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        //fit: StackFit.loose,
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
                      value: "Login Now",
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
                              validator: (value) =>
                                  validateProvider.emailValidator(value),
                              hintText: "Enter Your Email ID",
                              inputType: TextInputType.emailAddress,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Consumer<ValidatorProvider>(
                                builder: (context, notifier, child) {
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
                                  icon: Icon(
                                    notifier.isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPasswordScreen(),
                                    ),
                                  );
                                },
                                child: const ModelText(
                                  sizeFont: 14.0,
                                  colorFont: Colors.white,
                                  value: "Forget Password ?",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                } else {}
                              },
                              child: Container(
                                height: height * 0.05,
                                width: width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const ModelText(
                                    sizeFont: 16.0,
                                    colorFont: buttonText,
                                    value: "Login"),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            // RichText(
                            //   text: TextSpan(
                            //     style: GoogleFonts.inter(
                            //       fontSize: 15.0,
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.white,
                            //     ),
                            //     children: [
                            //       TextSpan(
                            //         text: "You don't have an Account ? ",
                            //         style: GoogleFonts.inter(
                            //           fontSize: 15.0,
                            //           fontWeight: FontWeight.bold,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //       TextSpan(
                            //           text: " Register Now !",
                            //           style: GoogleFonts.inter(
                            //             fontSize: 15.0,
                            //             fontWeight: FontWeight.bold,
                            //             color: richText,
                            //           ),
                            //           recognizer: TapGestureRecognizer()
                            //             ..onTap = () {
                            //               Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       const RegistrationScreen(),
                            //                 ),
                            //               );
                            //             }),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
