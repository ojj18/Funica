// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import '../../navigation.dart';
import '/models/chair_model.dart';

import '../../home/widget/grid_card.dart';

class ChairHomeScreen extends StatelessWidget {
  ChairHomeScreen({super.key});
  static const routeName = 'ChairHomeScreen/';
  ChairModel chairModel = ChairModel();
  List<ChairModel>? chairList = [];
  String? title = "Chair";
  getItems() async {
    var response = await rootBundle.loadString("assets/Json/Chair.json");
    List<dynamic> extractData = json.decode(response);
    extractData.map((e) {
      chairModel = ChairModel.fromJson(e);
      chairList!.add(chairModel);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getItems(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ChairWidget(
            title: title,
            chairList: chairList,
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

class ChairWidget extends StatelessWidget {
  const ChairWidget({this.title, this.chairList, super.key});

  final List<ChairModel>? chairList;
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
            itemCount: chairList!.length,
            itemBuilder: (context, index) {
              return GridCard(
                id: chairList![index].id,
                image: chairList![index].image,
                name: chairList![index].name,
                price: chairList![index].price,
                sold: chairList![index].sold,
                star: chairList![index].star,
              );
            }));
  }
}
