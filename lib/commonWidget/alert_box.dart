import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:funica/screens/signIn/login_screen.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({super.key});

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
        (() => Navigator.pushReplacementNamed(context, LoginScreen.routeName)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: const Color(0xff5b5b5b),
                borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.verified_user,
              color: Colors.white,
              size: 50,
            )),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Congratulations",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff5b5b5b),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Your account is ready to use. You will be redirected to the home page in a few seconds.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff5b5b5b),
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              flex: 1,
              child: SpinKitFadingCircle(
                color: Color(0xff8bad1c),
              ),
            )
          ],
        ),
      ),
    );
  }
}
