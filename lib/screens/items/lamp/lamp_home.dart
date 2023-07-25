// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../../models/lamp_model.dart';
import '../../home/widget/grid_card.dart';
import '../../navigation.dart';

class LampHomeScreen extends StatelessWidget {
  LampHomeScreen({super.key});
  static const routeName = 'LampHomeScreen/';
  LampModel lampModel = LampModel();
  List<LampModel>? lampList = [];
  String? title = "Lamp";
  getItems() async {
    var response = await rootBundle.loadString("assets/Json/lamp.json");
    List<dynamic> extractData = json.decode(response);
    extractData.map((e) {
      lampModel = LampModel.fromJson(e);
      lampList!.add(lampModel);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getItems(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LampWidget(
            title: title,
            lampList: lampList,
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

class LampWidget extends StatelessWidget {
  const LampWidget({this.title, this.lampList, super.key});

  final List<LampModel>? lampList;
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
            itemCount: lampList!.length,
            itemBuilder: (context, index) {
              return GridCard(
                id: lampList![index].id,
                image: lampList![index].image,
                name: lampList![index].name,
                price: lampList![index].price,
                sold: lampList![index].sold,
                star: lampList![index].star,
              );
            }));
  }
}
