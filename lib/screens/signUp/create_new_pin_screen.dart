import 'package:flutter/material.dart';
import 'package:funica/constants/theme_data.dart';
import '/commonWidget/alert_box.dart';
import '/commonWidget/button.dart';
import '/commonWidget/form_field.dart';
import '/screens/signUp/create_user_profile_screen.dart';

class CreateNewPinScreen extends StatefulWidget {
  const CreateNewPinScreen({super.key});

  static const routeName = "createnewpinScreen/";

  @override
  State<CreateNewPinScreen> createState() => _CreateNewPinScreenState();
}

class _CreateNewPinScreenState extends State<CreateNewPinScreen> {
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
            color: Color(0xff8bad1c),
            size: 28,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(
                context, CreateUserProfileScreen.routeName);
          },
        ),
        title: const Text(
          "Create New PIN",
          style: ThemeStyle.headerText,
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
                          const Text(
                              "Add a PIN number to make your account more secure",
                              style: ThemeStyle.subHeader),
                          const SizedBox(
                            height: 20,
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
          )),
    );
  }
}
