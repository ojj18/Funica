import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:funica/constants/theme_data.dart';
import 'package:funica/screens/navigation.dart';

import '../../commonWidget/button.dart';
import '../checkOut/checkout_screen.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  static const routeName = "MycardScreen/";

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
            Navigator.of(context).popAndPushNamed(MyNavigation.routeName);
          },
        ),
        title: const Text(
          "My Cart",
          style: ThemeStyle.headerText,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesome.search,
              color: Color(0xff8bad1c),
              size: 20,
            ),
          ),
        ],
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
                      padding: EdgeInsets.all(20.0),
                      child: CartCard(),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    Text(
                      "Total price",
                      style: ThemeStyle.header_7,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$170.00",
                      style: ThemeStyle.header_8,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: CommonButton(
                    onButtonTap: () => Navigator.pushReplacementNamed(
                        context, CheckOutScreen.routeName),
                    buttonTextColor: Colors.white,
                    height: 50,
                    buttonText: "Checkout",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartCard extends StatefulWidget {
  const CartCard({super.key});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int? quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/images/chairs/chair_1.jpg'),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Lawson Chair",
                    style: ThemeStyle.header_8,
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Remove From Cart?",
                                      style: ThemeStyle.header_8,
                                    ),
                                    const Divider(),
                                    const CartCard(),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonButton(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          onButtonTap: () {},
                                          isBorderEnable: true,
                                          buttonTextColor: Colors.black,
                                          height: 50,
                                          buttonText: "cancel",
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CommonButton(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          onButtonTap: () {},
                                          buttonTextColor: Colors.white,
                                          height: 50,
                                          buttonText: "Yes, Remove",
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Color(0xff8bad1c),
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const Text(
                    "Brown",
                    style: ThemeStyle.header_4,
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "\$170.00",
                    style: ThemeStyle.header_8,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity != 0) {
                                  quantity = quantity! - 1;
                                }
                              });
                            },
                            icon: const Icon(
                              Entypo.minus,
                              size: 18,
                              color: Color(0xff8bad1c),
                            ),
                          ),
                          Text(quantity!.toString(),
                              style: ThemeStyle.header_4),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity = quantity! + 1;
                              });
                            },
                            icon: const Icon(
                              Entypo.plus,
                              size: 18,
                              color: Color(0xff8bad1c),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
