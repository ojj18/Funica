import 'package:flutter/material.dart';
import '/commonWidget/alert_box.dart';
import '/commonWidget/button.dart';
import '/commonWidget/form_field.dart';
import '/screens/signIn/login_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  static const routeName = "createNewPasswordScreen/";

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool _isObscuretext = false;
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Create Your New Password",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonFormField(
                              obscureText: _isObscuretext,
                              hintText: "Password",
                              initialText: "",
                              prefixIcon: Icons.lock,
                              suffixIcon: _isObscuretext
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              suffixIconEvent: () {
                                setState(() {
                                  _isObscuretext = !_isObscuretext;
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
                              height: 20,
                            ),
                            CommonFormField(
                              obscureText: _isObscuretext,
                              hintText: "Confirm Password",
                              initialText: "",
                              prefixIcon: Icons.lock,
                              suffixIcon: _isObscuretext
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              suffixIconEvent: () {
                                setState(() {
                                  _isObscuretext = !_isObscuretext;
                                });
                              },
                              onError: (value) {
                                if (value.isEmpty) {
                                  return "Please enter the email";
                                }
                              },
                              onSave: (value) {},
                            ),
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
              onButtonTap: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const AlertBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
