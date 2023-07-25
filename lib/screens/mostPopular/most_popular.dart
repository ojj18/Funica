import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../models/items_model.dart';
import '../home/widget/grid_card.dart';
import '../home/widget/popular_list.dart';
import '../navigation.dart';

class MostpopularScreen extends StatefulWidget {
  const MostpopularScreen(
      {this.title, this.itemList, this.mostPopular, super.key});

  final List<dynamic>? mostPopular;
  final List<ItemModel>? itemList;
  final String? title;

  static const routeName = "MostpopularScreen/";
  @override
  State<MostpopularScreen> createState() => _MostpopularScreenState();
}

class _MostpopularScreenState extends State<MostpopularScreen> {
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
            Navigator.of(context).pushReplacementNamed(MyNavigation.routeName);
          },
        ),
        title: Text(
          widget.title!,
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
                size: 15,
              ))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 50,
                  width: double.maxFinite,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.mostPopular!.length,
                      itemBuilder: (context, index) {
                        return PopularList(
                            label: widget.mostPopular![index]['label'],
                            onTap: () {
                              setState(() {});
                            },
                            index: index);
                      }),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.3,
                            mainAxisSpacing: 10),
                    itemCount: widget.itemList!.length,
                    itemBuilder: (context, index) {
                      return GridCard(
                        id: widget.itemList![index].id,
                        image: widget.itemList![index].image,
                        name: widget.itemList![index].name,
                        price: widget.itemList![index].price,
                        sold: widget.itemList![index].sold,
                        star: widget.itemList![index].star,
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
