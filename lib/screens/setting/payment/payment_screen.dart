import 'package:flutter/material.dart';

import '../../../commonWidget/button.dart';
import '../../navigation.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  static const routeName = '/PaymentScreen';
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Colors.black,
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
                const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CardWidget(
                          image: 'assets/images/paypal.png',
                          paymentLable: 'PayPal',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CardWidget(
                          image: 'assets/images/google.png',
                          paymentLable: 'Google Pay',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CardWidget(
                          image: 'assets/images/apple.png',
                          paymentLable: 'Apple Pay',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CardWidget(
                          image: 'assets/images/mastercard.png',
                          paymentLable: '**** **** **** **** 4679',
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CommonButton(
                      elevation: 10,
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      radius: 30,
                      buttonText: "Add New Card",
                      onButtonTap: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({this.image, this.paymentLable, super.key});

  final String? image;
  final String? paymentLable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: 1.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      image!,
                    ),
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(paymentLable!),
                ],
              ),
              const Text("Connected")
            ],
          ),
        ),
      ),
    );
  }
}
