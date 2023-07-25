// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../../models/vase_model.dart';
import '../../home/widget/grid_card.dart';
import '../../navigation.dart';

class VaseHomeScreen extends StatelessWidget {
  VaseHomeScreen({super.key});
  static const routeName = 'VaseHomeScreen/';
  VaseModel vaseModel = VaseModel();
  List<VaseModel>? vaseList = [];
  String? title = "Vase";
  getItems() async {
    var response = await rootBundle.loadString("assets/Json/vase.json");
    List<dynamic> extractData = json.decode(response);
    extractData.map((e) {
      vaseModel = VaseModel.fromJson(e);
      vaseList!.add(vaseModel);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getItems(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return VaseWidget(
            title: title,
            vaseList: vaseList,
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

class VaseWidget extends StatelessWidget {
  const VaseWidget({this.title, this.vaseList, super.key});

  final List<VaseModel>? vaseList;
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
            itemCount: vaseList!.length,
            itemBuilder: (context, index) {
              return GridCard(
                id: vaseList![index].id,
                image: vaseList![index].image,
                name: vaseList![index].name,
                price: vaseList![index].price,
                sold: vaseList![index].sold,
                star: vaseList![index].star,
              );
            }));
  }
}
