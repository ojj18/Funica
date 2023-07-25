import 'package:flutter/material.dart';
import '/commonWidget/button.dart';
import '/screens/signUp/welcome_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({super.key});
  static const routeName = "introSliderScreen/";

  @override
  State<IntroSliderScreen> createState() => _IntroSliderScreen();
}

class _IntroSliderScreen extends State<IntroSliderScreen> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 150),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            SizedBox(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/intro1.jpg"))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade50,
                    child: const Text(
                      "We provide high quality products just for you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/intro2.jpg"))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade50,
                    child: const Text(
                      "Your satisfaction is our number one priority",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/intro3.jpg"))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade50,
                    child: const Text(
                      "Let's fulfill your house needs with Funica right now!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        padding: const EdgeInsets.all(10),
        color: Colors.grey.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                    spacing: 10,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.black26,
                    activeDotColor: Colors.black,
                    radius: 50),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut),
              ),
            ),
            CommonButton(
              height: 60,
              width: MediaQuery.of(context).size.width,
              radius: 30,
              buttonText: isLastPage ? "Get Started" : "Next",
              onButtonTap: () => isLastPage
                  ? Navigator.pushReplacementNamed(
                      context, WelcomeScreen.routeName)
                  : controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
            ),
          ],
        ),
      ),
    );
  }
}
