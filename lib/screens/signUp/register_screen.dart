import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:funica/constants/theme_data.dart';
import '/commonWidget/button.dart';
import '/commonWidget/form_field.dart';
import '/screens/signIn/login_screen.dart';
import '/screens/signUp/create_user_profile_screen.dart';
import '/screens/signUp/welcome_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = "registerScreen/";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isChecked = false;
  bool isObscuretext = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff8bad1c),
            size: 28,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, WelcomeScreen.routeName);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // SizedBox(
                    //   height: 200,
                    //   child: Image.asset(
                    //     "assets/images/splashIcon.png",
                    //     color: Colors.black,
                    //     alignment: Alignment.center,
                    //   ),
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Create Your Account",
                          style: ThemeStyle.header_1,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CommonFormField(
                          hintText: "Email",
                          initialText: "",
                          prefixIcon: Icons.email,
                          onError: (value) {
                            if (value.isEmpty) {
                              return "Please enter the email";
                            }
                          },
                          onSave: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonFormField(
                          obscureText: isObscuretext,
                          hintText: "Password",
                          initialText: "",
                          prefixIcon: Icons.lock,
                          suffixIcon: isObscuretext
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixIconEvent: () {
                            setState(() {
                              isObscuretext = !isObscuretext;
                            });
                          },
                          onError: (value) {
                            if (value.isEmpty) {
                              return "Please enter the email";
                            }
                          },
                          onSave: (value) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              activeColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1.5, style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            const Text(
                              "Remember me",
                              style: ThemeStyle.subHeader,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonButton(
                            elevation: 10,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            radius: 30,
                            buttonText: "Sign up",
                            onButtonTap: () => Navigator.pushReplacementNamed(
                                context, CreateUserProfileScreen.routeName)),
                        const SizedBox(
                          height: 20,
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
                              "or continue with",
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
                          height: 20,
                        ),
                        _iconButtons(() {}, () {}, () {}),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Already have an account? ",
                                style: ThemeStyle.header_2,
                              ),
                              const WidgetSpan(
                                  child: SizedBox(
                                width: 10,
                              )),
                              TextSpan(
                                  text: "Sign in",
                                  style: ThemeStyle.header_3,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.pushReplacementNamed(
                                            context, LoginScreen.routeName)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _iconButtons(
    VoidCallback onClickFaceBook,
    VoidCallback onClickGoogle,
    VoidCallback onClickApple,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onClickFaceBook,
          child: Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              FontAwesome5.facebook,
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: onClickGoogle,
          child: Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              FontAwesome5.google,
              color: Colors.red,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: onClickApple,
          child: Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              FontAwesome5.apple,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
