import 'package:flutter/material.dart';

import '../../navigation.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static const routeName = '/NotificationScreen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool notificationEnable = true;
  bool soundEnable = true;
  bool vibrateEnable = false;
  bool specialOffersEnable = true;
  bool promoEnable = false;
  bool paymentEnable = true;
  bool cashBackEnable = false;
  bool appUpdateEnable = true;
  bool serviceAvailableEnable = false;
  bool tipsAvailableEnable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Color(0xff5b5b5b),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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
                ListTile(
                    leading: const Text("General Notification"),
                    trailing: Switch(
                        value: notificationEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          notificationEnable = value;
                        })),
                ListTile(
                    leading: const Text("Sound"),
                    trailing: Switch(
                        value: soundEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          soundEnable = value;
                        })),
                ListTile(
                    leading: const Text("Vibrate"),
                    trailing: Switch(
                        value: vibrateEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          vibrateEnable = value;
                        })),
                ListTile(
                    leading: const Text("Special Offers"),
                    trailing: Switch(
                        value: specialOffersEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          specialOffersEnable = value;
                        })),
                ListTile(
                    leading: const Text("Promo & Discount"),
                    trailing: Switch(
                        value: promoEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          promoEnable = value;
                        })),
                ListTile(
                    leading: const Text("Payment"),
                    trailing: Switch(
                        value: paymentEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          paymentEnable = value;
                        })),
                ListTile(
                    leading: const Text("Cashback"),
                    trailing: Switch(
                        value: cashBackEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          cashBackEnable = value;
                        })),
                ListTile(
                    leading: const Text("App Updates"),
                    trailing: Switch(
                        value: appUpdateEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          appUpdateEnable = value;
                        })),
                ListTile(
                    leading: const Text("New Service Available"),
                    trailing: Switch(
                        value: serviceAvailableEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          serviceAvailableEnable = value;
                        })),
                ListTile(
                    leading: const Text("New Tips Available"),
                    trailing: Switch(
                        value: tipsAvailableEnable,
                        activeColor: const Color(0xff8bad1c),
                        onChanged: (value) {
                          setState(() {});
                          tipsAvailableEnable = value;
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
