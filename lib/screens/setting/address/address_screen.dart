import 'package:flutter/material.dart';
import 'package:funica/constants/theme_data.dart';
import 'package:funica/screens/navigation.dart';
import '/commonWidget/form_field.dart';

import '../../../commonWidget/button.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  static const routeName = "/AddressScreen";
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
            Navigator.popAndPushNamed(context, MyNavigation.routeName);
          },
        ),
        title: const Text(
          "Address",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: AddressCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressCard extends StatefulWidget {
  const AddressCard({super.key});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(60)),
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xff8bad1c),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: ThemeStyle.headerText,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "61480 Sunbrook Park, PC 5679",
                  style: ThemeStyle.subHeader,
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Center(
                                        child: Text("Address Details",
                                            style: ThemeStyle.headerText),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Name Address",
                                        style: ThemeStyle.header_5,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const CommonFormField(
                                        initialText: "Apartment",
                                        isPrefixIcon: false,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Address Details",
                                        style: ThemeStyle.header_5,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const CommonFormField(
                                        initialText:
                                            "2899 Summer Drive Taylor, PC 48180",
                                        isPrefixIcon: false,
                                        suffixIcon: Icons.location_on,
                                        suffixIconColor: Color(0xff8bad1c),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                            activeColor:
                                                const Color(0xff8bad1c),
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 1.5,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          const Text(
                                            "Make this as the default address",
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          radius: 30,
                                          buttonText: "Add",
                                          onButtonTap: () {}),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(
                  Icons.mode_edit,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}
