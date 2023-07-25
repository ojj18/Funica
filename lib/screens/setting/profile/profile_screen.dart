import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:funica/constants/theme_data.dart';
import 'package:funica/screens/signIn/login_screen.dart';
import '../../navigation.dart';
import '/screens/setting/language/language_screen.dart';
import '/screens/setting/notification/notification_screen.dart';
import '/screens/setting/address/address_screen.dart';
import '/screens/setting/payment/payment_screen.dart';
import '/screens/setting/privacy/privacy_policy_screen.dart';
import '/screens/setting/security/security_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = "/ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  bool? isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        title: const Text(
          "Profile",
          style: ThemeStyle.headerText,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MyNavigation.routeName);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff8bad1c),
          ),
        ),
      ),
      body: CustomScrollView(
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
                                  image:
                                      AssetImage("assets/images/userimage.png"))
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
                                  borderRadius: BorderRadius.circular(5)),
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
                  height: 20,
                ),
                const Column(
                  children: [
                    Text(
                      "Andrew Ainsley",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "+1 111 467 378 399",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, EditProfileScreen.routeName);
                  },
                  leading: const Icon(
                    LineariconsFree.user_1,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: const Text("Edit Profile"),
                  trailing: const Icon(Entypo.right_open_big),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AddressScreen.routeName);
                  },
                  leading: const Icon(
                    Linecons.location,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: const Text("Address"),
                  trailing: const Icon(Entypo.right_open_big),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, NotificationScreen.routeName);
                  },
                  leading: const Icon(
                    FontAwesome.bell,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: const Text("Notification"),
                  trailing: const Icon(Entypo.right_open_big),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, PaymentScreen.routeName);
                  },
                  leading: const Icon(
                    Linecons.wallet,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: const Text("Payment"),
                  trailing: const Icon(Entypo.right_open_big),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, SecurityScreen.routeName);
                  },
                  leading: const Icon(
                    Icons.security,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: const Text("Security"),
                  trailing: const Icon(Entypo.right_open_big),
                ),
                ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, LanguageScreen.routeName);
                    },
                    leading: const Icon(
                      Icons.language,
                      color: Colors.black,
                      size: 20,
                    ),
                    title: const Text("Language"),
                    trailing: const Icon(Entypo.right_open_big)),
                ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, PrivacyPolicyScreen.routeName);
                    },
                    leading: const Icon(
                      Linecons.lock,
                      color: Colors.black,
                      size: 20,
                    ),
                    title: const Text("Privacy Policy"),
                    trailing: const Icon(Entypo.right_open_big)),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  leading: const Icon(
                    Entypo.logout,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                  title: const Text("Logout",
                      style: TextStyle(color: Colors.redAccent)),
                  trailing: const Icon(Entypo.right_open_big),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
