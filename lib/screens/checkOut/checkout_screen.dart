import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:funica/constants/theme_data.dart';
import '/screens/cart/cart_screen.dart';
import '/screens/orders/order_screen.dart';
import '/screens/setting/address/address_screen.dart';

import '../../commonWidget/button.dart';
import '../../constants/enum.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  static const routeName = "CheckoutScreen/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff8bad1c),
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(MyCardScreen.routeName);
          },
        ),
        title: const Text(
          "Checkout",
          style: TextStyle(
              color: Color(0xff5b5b5b),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipping Address",
                            style: TextStyle(
                              color: Color(0xff5b5b5b),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AddressCard(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Order List",
                            style: TextStyle(
                              color: Color(0xff5b5b5b),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CartCard(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: CommonButton(
                onButtonTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentGateWayScreen())),
                buttonTextColor: Colors.white,
                height: 50,
                buttonText: "Continue To Payment",
              ))
        ],
      ),
    );
  }
}

class PaymentGateWayScreen extends StatefulWidget {
  const PaymentGateWayScreen({super.key});

  @override
  State<PaymentGateWayScreen> createState() => _PaymentGateWayScreenState();
}

class _PaymentGateWayScreenState extends State<PaymentGateWayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff8bad1c),
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(MyCardScreen.routeName);
          },
        ),
        title: const Text(
          "Payment Gateway",
          style: ThemeStyle.headerText,
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            PaymentCard(
                              image: 'assets/images/paypal.png',
                              paymentLable: 'PayPal',
                              paymentMethod: PaymentGateWay.payPal,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            PaymentCard(
                              image: 'assets/images/google.png',
                              paymentLable: 'Google Pay',
                              paymentMethod: PaymentGateWay.googlePay,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            PaymentCard(
                              image: 'assets/images/apple.png',
                              paymentLable: 'Apple Pay',
                              paymentMethod: PaymentGateWay.applePay,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            PaymentCard(
                              image: 'assets/images/mastercard.png',
                              paymentLable: '**** **** **** **** 4679',
                              paymentMethod: PaymentGateWay.masterCard,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CommonButton(
                          elevation: 10,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          radius: 30,
                          buttonText: "Confirm Payment",
                          onButtonTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff8bad1c),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: const Icon(
                                              FontAwesome5.shopping_cart,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                          const Text(
                                            "Order Successful!",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff5b5b5b),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "You have successfully made order",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade600),
                                          ),
                                          CommonButton(
                                            onButtonTap: () =>
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    OrderScreen.routeName),
                                            buttonTextColor: Colors.white,
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            buttonText: "View Order",
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
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
    );
  }
}

class PaymentCard extends StatefulWidget {
  const PaymentCard(
      {this.image,
      this.paymentLable,
      this.paymentMethod = PaymentGateWay.payPal,
      super.key});

  final String? image;
  final String? paymentLable;
  final PaymentGateWay paymentMethod;

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  PaymentGateWay _paymentMethod = PaymentGateWay.payPal;
  @override
  void initState() {
    _paymentMethod = widget.paymentMethod;
    super.initState();
  }

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
                      widget.image!,
                    ),
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.paymentLable!),
                ],
              ),
              Radio(
                activeColor: const Color(0xff8bad1c),
                value: PaymentGateWay.payPal,
                groupValue: _paymentMethod,
                onChanged: (PaymentGateWay? value) {
                  setState(() {
                    _paymentMethod = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
