import 'dart:async';

import 'package:flutter/material.dart';
import '/screens/intro/intro_slider_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = "introScreen/";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        (() => Navigator.pushReplacementNamed(
            context, IntroSliderScreen.routeName)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Color.fromARGB(231, 99, 99, 99), BlendMode.modulate),
            fit: BoxFit.cover,
            image: AssetImage("assets/images/intro.jpg"),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Wave furniture",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "The best furniture e-commerce app of the century for your daily need!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
