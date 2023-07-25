// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:funica/models/sofa_model.dart';

import '../../home/widget/grid_card.dart';
import '../../navigation.dart';

class SofaHomeScreen extends StatelessWidget {
  SofaHomeScreen({super.key});
  static const routeName = 'SofaHomeScreen/';
  SofaModel sofaModel = SofaModel();
  List<SofaModel>? sofaList = [];
  String? title = "Sofa";
  getItems() async {
    var response = await rootBundle.loadString("assets/Json/sofa.json");
    List<dynamic> extractData = json.decode(response);
    extractData.map((e) {
      sofaModel = SofaModel.fromJson(e);
      sofaList!.add(sofaModel);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getItems(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SofaWidget(
            title: title,
            sofaList: sofaList,
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

class SofaWidget extends StatelessWidget {
  const SofaWidget({this.title, this.sofaList, super.key});

  final List<SofaModel>? sofaList;
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
            itemCount: sofaList!.length,
            itemBuilder: (context, index) {
              return GridCard(
                id: sofaList![index].id,
                image: sofaList![index].image,
                name: sofaList![index].name,
                price: sofaList![index].price,
                sold: sofaList![index].sold,
                star: sofaList![index].star,
              );
            }));
  }
}
