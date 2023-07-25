// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:funica/screens/navigation.dart';

import '../../../models/kitchen_model.dart';
import '../../home/widget/grid_card.dart';

class KitchenHomeScreen extends StatelessWidget {
  KitchenHomeScreen({super.key});
  static const routeName = 'KitchenHomeScreen/';
  KitchenModel kitchenModel = KitchenModel();
  List<KitchenModel>? kitchenList = [];
  String? title = "Kitchen";
  getItems() async {
    var response = await rootBundle.loadString("assets/Json/Kitchen.json");
    List<dynamic> extractData = json.decode(response);
    extractData.map((e) {
      kitchenModel = KitchenModel.fromJson(e);
      kitchenList!.add(kitchenModel);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getItems(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return KitchenWidget(
            title: title,
            kitchenList: kitchenList,
          );
        } else {
          return const Center(
            child: SpinKitFadingCircle(
              color: Colors.black,
            ),
          );
        }
      }),
    );
  }
}

class KitchenWidget extends StatelessWidget {
  const KitchenWidget({this.title, this.kitchenList, super.key});

  final List<KitchenModel>? kitchenList;
  final String? title;
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
          title: Text(
            title!,
            style: const TextStyle(
                color: Color(0xff5b5b5b),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesome.search,
                  color: Color(0xff8bad1c),
                  size: 20,
                ))
          ],
        ),
        body: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.3,
                mainAxisSpacing: 10),
            itemCount: kitchenList!.length,
            itemBuilder: (context, index) {
              return GridCard(
                id: kitchenList![index].id,
                image: kitchenList![index].image,
                name: kitchenList![index].name,
                price: kitchenList![index].price,
                sold: kitchenList![index].sold,
                star: kitchenList![index].star,
              );
            }));
  }
}
