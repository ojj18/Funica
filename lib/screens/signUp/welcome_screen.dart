import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:funica/constants/theme_data.dart';
import '/commonWidget/button.dart';
import '/screens/intro/intro_slider_screen.dart';
import '/screens/signIn/login_screen.dart';
import '/screens/signUp/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const routeName = "WelcomeScreen/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, IntroSliderScreen.routeName);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(shrinkWrap: true, slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                // SizedBox(
                //   height: 200,
                //   child: Image.asset(
                //     "assets/images/splashIcon.png",
                //     color: Colors.black,
                //     alignment: Alignment.center,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Let's you in",
                        style: ThemeStyle.header_1,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CommonButton(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          radius: 20,
                          buttonIcon: FontAwesome5.facebook,
                          iconColor: Colors.blue,
                          isBorderEnable: true,
                          buttonText: "Continue with Facebook",
                          buttonTextColor: Colors.black,
                          onButtonTap: () => Navigator.pushReplacementNamed(
                              context, WelcomeScreen.routeName)),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonButton(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          radius: 20,
                          buttonIcon: FontAwesome5.google,
                          iconColor: Colors.red,
                          isBorderEnable: true,
                          buttonText: "Continue with Google",
                          buttonTextColor: Colors.black,
                          onButtonTap: () => Navigator.pushReplacementNamed(
                              context, WelcomeScreen.routeName)),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonButton(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          radius: 20,
                          buttonIcon: FontAwesome5.apple,
                          iconColor: Colors.black,
                          isBorderEnable: true,
                          buttonText: "Continue with Apple",
                          buttonTextColor: Colors.black,
                          onButtonTap: () => Navigator.pushReplacementNamed(
                              context, WelcomeScreen.routeName)),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "or",
                            style: ThemeStyle.header_2,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CommonButton(
                          elevation: 10,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          radius: 30,
                          buttonText: "Sign in with password",
                          onButtonTap: () => Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName)),
                      const SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Don't have an account? ",
                              style: ThemeStyle.header_2,
                            ),
                            const WidgetSpan(
                                child: SizedBox(
                              width: 10,
                            )),
                            TextSpan(
                                text: "Sign up",
                                style: ThemeStyle.header_3,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.pushReplacementNamed(
                                          context, RegisterScreen.routeName)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ]),
        ));
  }
}
