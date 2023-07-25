// ignore_for_file: must_be_immutable, unused_field

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:funica/constants/theme_data.dart';
import '/commonWidget/form_field.dart';
import '/models/function_model.dart';
import '/models/special_offer_model.dart';
import '/screens/home/widget/function_list.dart';
import '/screens/home/widget/grid_card.dart';
import '/screens/home/widget/popular_list.dart';
import '/screens/mostPopular/most_popular.dart';
import '/screens/specialOffer/special_offer.dart';

import '../../models/items_model.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "HomeScreen/";

  SpecialOfferModel specialOffer = SpecialOfferModel();
  List<SpecialOfferModel>? specialOfferList = [];
  FunctionModel functionModel = FunctionModel();
  List<FunctionModel>? functionList = [];
  List<dynamic>? mostPopular = [];
  ItemModel itemModel = ItemModel();
  List<ItemModel>? itemList = [];

  HomeScreen({super.key});

  getDataList() async {
    //Special data list getting
    specialOfferList = [];
    var specialDataListResponse =
        await rootBundle.loadString("assets/Json/special_offers.json");
    List<dynamic> extractSpecialData = json.decode(specialDataListResponse);
    extractSpecialData.map((e) {
      specialOffer = SpecialOfferModel.fromJson(e);
      specialOfferList!.add(specialOffer);
    }).toList();

    //Function data list getting
    functionList = [];
    var functionDataListResponse =
        await rootBundle.loadString("assets/Json/function.json");
    List<dynamic> extractFunctionData = json.decode(functionDataListResponse);
    extractFunctionData.map((e) {
      functionModel = FunctionModel.fromJson(e);
      functionList!.add(functionModel);
    }).toList();

    //Mostpopular data list getting
    var mostPopularResponse =
        await rootBundle.loadString("assets/Json/mostPopular.json");
    mostPopular = json.decode(mostPopularResponse);

    //Item data list getting
    itemList = [];
    var itemDataResponse =
        await rootBundle.loadString("assets/Json/items.json");
    List<dynamic> extractItemData = json.decode(itemDataResponse);
    extractItemData.map((e) {
      itemModel = ItemModel.fromJson(e);
      itemList!.add(itemModel);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return HomeWidget(
            specialOffer: specialOffer,
            specialOfferList: specialOfferList,
            functionModel: functionModel,
            functionList: functionList,
            itemModel: itemModel,
            itemList: itemList,
            mostPopular: mostPopular,
          );
        } else {
          return const Center(
            child: SpinKitFadingCircle(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget(
      {this.specialOffer,
      this.specialOfferList,
      this.functionModel,
      this.functionList,
      this.itemModel,
      this.itemList,
      this.mostPopular,
      super.key});

  SpecialOfferModel? specialOffer = SpecialOfferModel();
  List<SpecialOfferModel>? specialOfferList;
  FunctionModel? functionModel = FunctionModel();
  List<FunctionModel>? functionList;
  List<dynamic>? mostPopular;
  ItemModel? itemModel = ItemModel();
  List<ItemModel>? itemList;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final controller = PageController();
  SpecialOfferModel _specialOffer = SpecialOfferModel();
  List<SpecialOfferModel>? _specialOfferList = [];
  FunctionModel _functionModel = FunctionModel();
  List<FunctionModel>? _functionList = [];
  List<dynamic>? _mostPopular = [];
  ItemModel _itemModel = ItemModel();
  List<ItemModel>? _itemList = [];

  @override
  void initState() {
    _specialOffer = widget.specialOffer!;
    _specialOfferList = widget.specialOfferList!;
    _functionModel = widget.functionModel!;
    _functionList = widget.functionList!;
    _itemModel = widget.itemModel!;
    _itemList = widget.itemList;
    _mostPopular = widget.mostPopular!;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _specialOfferList = [];
    _functionList = [];
    _itemList = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage("assets/images/personImage.jpg"),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: ThemeStyle.subHeader,
                ),
                Text(
                  "Andrew Ainsley",
                  style: ThemeStyle.headerText,
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesome.bell,
                size: 20,
                color: Color(0xff8bad1c),
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesome.heart_empty,
                size: 20,
                color: Color(0xff8bad1c),
              ))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CommonFormField(
                        isPrefixIcon: true,
                        prefixIcon: FontAwesome.search,
                        prefixIconColor: Colors.grey.shade600,
                        prefixIconSize: 15,
                        suffixIcon: Icons.tune,
                        suffixIconColor: Colors.black,
                        hintText: 'search',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Special Offers",
                            style: ThemeStyle.headerText,
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SpecialOfferScreen(
                                          specialOfferList: _specialOfferList,
                                          title: "Special Offers",
                                        ))),
                            child: const Text(
                              "See All",
                              style: ThemeStyle.header_6,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: CarouselSlider.builder(
                        itemCount: _specialOfferList!.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _specialOfferList![index].discount!,
                                        style: ThemeStyle.header_1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: Text(
                                          _specialOfferList![index].deals!,
                                          style: ThemeStyle.header_5,
                                        ),
                                      ),
                                      Text(
                                        _specialOfferList![index].desc!,
                                        style: ThemeStyle.header_6,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Image(
                                      image: AssetImage(
                                          _specialOfferList![index].image!)),
                                )
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 180.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _functionList!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return FunctionList(
                              labelIcon: _functionList![index].icon,
                              labelText: _functionList![index].label,
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Most Popular",
                            style: ThemeStyle.headerText,
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MostpopularScreen(
                                          title: "Most Popular",
                                          mostPopular: _mostPopular,
                                          itemList: _itemList,
                                        ))),
                            child: const Text(
                              "See All",
                              style: ThemeStyle.header_6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 40,
                      width: double.maxFinite,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 20.0),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _mostPopular!.length,
                          itemBuilder: (context, index) {
                            return PopularList(
                                label: _mostPopular![index]['label'],
                                onTap: () {},
                                index: index);
                          }),
                    )
                  ],
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.5,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 0),
                    itemCount: _itemList!.length,
                    itemBuilder: (context, index) {
                      return GridCard(
                        id: _itemList![index].id,
                        image: _itemList![index].image,
                        name: _itemList![index].name,
                        price: _itemList![index].price,
                        sold: _itemList![index].sold,
                        star: _itemList![index].star,
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
