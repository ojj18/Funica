import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:funica/screens/navigation.dart';
import '/commonWidget/button.dart';
import '/commonWidget/form_field.dart';
import '/screens/signUp/create_new_pin_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const routeName = "EditProfileScreen/";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  final TextEditingController _dateController =
      TextEditingController(text: "12/27/1995");
  final TextEditingController controller =
      TextEditingController(text: "+1 111 467 378 399");
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
            Navigator.popAndPushNamed(context, MyNavigation.routeName);
          },
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
              color: Color(0xff5b5b5b),
              fontSize: 16,
              fontWeight: FontWeight.w500),
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
                                              "assets/images/personImage.jpg"))
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
                                          color: Colors.black,
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
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonFormField(
                              isPrefixIcon: false,
                              hintText: "Full Name",
                              initialText: "Andrew Ainsley",
                              onError: (value) {
                                if (value.isEmpty) {
                                  return "Please enter the email";
                                }
                              },
                              onSave: (value) {},
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CommonFormField(
                              isPrefixIcon: false,
                              hintText: "Nickname",
                              initialText: "Andrew",
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
                              initialText: "andrew_anisley@yourdomain.com",
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
                            const SizedBox(
                              height: 20,
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
                buttonText: "Update",
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
