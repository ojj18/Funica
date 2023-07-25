import 'package:flutter/material.dart';
import 'package:funica/screens/navigation.dart';

import '../../../commonWidget/button.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  static const routeName = '/SecurityScreen';

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool isRemember = true;
  bool isFaceID = false;
  bool isBiometric = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        title: const Text(
          "Security",
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Remember me"),
                          Switch(
                              value: isRemember,
                              activeColor: const Color(0xff8bad1c),
                              onChanged: (value) {
                                setState(() {});
                                isRemember = value;
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("General Notification"),
                          Switch(
                              value: isFaceID,
                              activeColor: const Color(0xff8bad1c),
                              onChanged: (value) {
                                setState(() {});
                                isFaceID = value;
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("General Notification"),
                          Switch(
                              value: isBiometric,
                              activeColor: const Color(0xff8bad1c),
                              onChanged: (value) {
                                setState(() {});
                                isBiometric = value;
                              })
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
                          buttonText: "Change PIN",
                          onButtonTap: () {}),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonButton(
                          elevation: 10,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          radius: 30,
                          buttonText: "Add New Card",
                          onButtonTap: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
