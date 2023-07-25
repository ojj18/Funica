import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:funica/constants/theme_data.dart';
import '/screens/navigation.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const routeName = "OrderScreen/";

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
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: OrderCard(),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lawson Chair",
                    style: ThemeStyle.header_8,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
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
                  const VerticalDivider(),
                  const Text(
                    "Qty = 1",
                    style: ThemeStyle.header_4,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: const Text(
                  "In Delivery",
                  style: ThemeStyle.subHeader,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Text(
                  "\$170.00",
                  style: ThemeStyle.header_8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
