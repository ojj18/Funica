import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:funica/constants/theme_data.dart';
import '/commonWidget/button.dart';
import '/commonWidget/form_field.dart';
import '/screens/signUp/create_new_pin_screen.dart';
import '/screens/signUp/register_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CreateUserProfileScreen extends StatefulWidget {
  const CreateUserProfileScreen({super.key});

  static const routeName = "createuserprofileScreen/";

  @override
  State<CreateUserProfileScreen> createState() =>
      _CreateUserProfileScreenState();
}

class _CreateUserProfileScreenState extends State<CreateUserProfileScreen> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  DateTime selectedDate = DateTime.now();
  String? genderValue = 'Male';
  List<String> genders = ['Male', 'Female'];
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
            Navigator.popAndPushNamed(context, RegisterScreen.routeName);
          },
        ),
        title: const Text(
          "Fill Your Profile",
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
                        SizedBox(
                          height: 150,
                          child: Center(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(75),
                                  image: image == null
                                      ? const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/userimage.png"))
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(File(image!.path)))),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () async {
                                      image = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff8bad1c),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonFormField(
                              isPrefixIcon: false,
                              hintText: "Full Name",
                              initialText: "",
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
                              isPrefixIcon: false,
                              hintText: "Nickname",
                              initialText: "",
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
                              isPrefixIcon: false,
                              hintText: "Date of birth",
                              textController: _dateController,
                              suffixIcon: Linecons.calendar,
                              suffixIconEvent: () {
                                _selectDate(context);
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
                              isPrefixIcon: false,
                              hintText: "Email",
                              initialText: "",
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
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(15)),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {},
                                onInputValidated: (bool value) {},
                                selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DROPDOWN,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle:
                                    const TextStyle(color: Colors.black),
                                initialValue: number,
                                textFieldController: controller,
                                formatInput: false,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                inputBorder: InputBorder.none,
                                textStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                                onSaved: (PhoneNumber number) {},
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(15)),
                              child: DropdownButton(
                                  isExpanded: true,
                                  underline: const SizedBox.shrink(),
                                  value: genderValue,
                                  items: genders.map((String genders) {
                                    return DropdownMenuItem(
                                      value: genders,
                                      child: Text(genders),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      genderValue = value as String;
                                    });
                                  }),
                            ),
                          ],
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
                onButtonTap: () => Navigator.pushReplacementNamed(
                    context, CreateNewPinScreen.routeName)),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101),
        builder: ((context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(primary: Colors.black)),
              child: child!);
        }));

    if (picked != null) {
      setState(() {
        selectedDate = picked;

        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }
}
