import 'package:flutter/material.dart';
import '/commonWidget/button.dart';
import '/commonWidget/form_field.dart';
import '/screens/forgotPassword/create_new_password_screen.dart';
import '/screens/signUp/create_user_profile_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  static const routeName = "otpScreen/";

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
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
            Navigator.popAndPushNamed(
                context, CreateUserProfileScreen.routeName);
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
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const Center(
                            child: Text(
                              "Code has been send to +1 111*****99",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonFormField(
                                  isPrefixIcon: false,
                                  isSuffixIcon: false,
                                  currentFocusNode: focusNode1,
                                  height: 80,
                                  width: 80,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      focusNode1.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(focusNode2);
                                    }
                                  },
                                ),
                                CommonFormField(
                                  isPrefixIcon: false,
                                  isSuffixIcon: false,
                                  currentFocusNode: focusNode2,
                                  height: 80,
                                  width: 80,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      focusNode2.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(focusNode3);
                                    }
                                  },
                                ),
                                CommonFormField(
                                  isPrefixIcon: false,
                                  isSuffixIcon: false,
                                  currentFocusNode: focusNode3,
                                  height: 80,
                                  width: 80,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      focusNode3.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(focusNode4);
                                    }
                                  },
                                ),
                                CommonFormField(
                                  isPrefixIcon: false,
                                  isSuffixIcon: false,
                                  currentFocusNode: focusNode4,
                                  height: 80,
                                  width: 80,
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Center(
                            child: Text(
                              "Resend code in 55s",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CommonButton(
                  elevation: 10,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  radius: 30,
                  buttonText: "verify",
                  onButtonTap: () => Navigator.pushReplacementNamed(
                      context, CreateNewPasswordScreen.routeName)),
            ],
          )),
    );
  }
}
