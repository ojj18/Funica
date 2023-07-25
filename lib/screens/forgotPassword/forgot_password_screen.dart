import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import '/commonWidget/button.dart';
import '/screens/forgotPassword/otp_screen.dart';
import '/screens/signIn/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const routeName = "forgotPasswordScreen/";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isNumberTapped = true;
  bool _isEmailTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, LoginScreen.routeName);
          },
        ),
        title: const Text(
          "Forgot Password",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Form(
                  child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: 200,
                          child: Image.asset(
                            "assets/images/splashIcon.png",
                            color: Colors.black,
                            alignment: Alignment.center,
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              "Select which contact details should we use to reset your password",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isNumberTapped = !_isNumberTapped;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.all(10),
                                height: 110,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _isNumberTapped
                                          ? Colors.black
                                          : Colors.grey.shade200,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      margin: const EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Icon(FontAwesome.commenting),
                                    ),
                                    const Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "via SMS",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "+1 111*****99",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isEmailTapped = !_isEmailTapped;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.all(10),
                                height: 110,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _isEmailTapped
                                          ? Colors.black
                                          : Colors.grey.shade200,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      margin: const EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Icon(Icons.mail),
                                    ),
                                    const Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "via Email",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "and***ley@yourdomain.com",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ),
            CommonButton(
                elevation: 10,
                height: 60,
                width: MediaQuery.of(context).size.width,
                radius: 30,
                buttonText: "Continue",
                onButtonTap: () => Navigator.pushReplacementNamed(
                    context, OTPScreen.routeName)),
          ],
        ),
      ),
    );
  }
}
