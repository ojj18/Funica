import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:funica/constants/theme_data.dart';

import '../../../commonWidget/item_content_screen.dart';

class GridCard extends StatefulWidget {
  const GridCard(
      {this.id,
      this.index,
      this.image,
      this.name = "",
      this.price,
      this.sold,
      this.star,
      super.key});
  final int? id;
  final int? index;
  final String? image;
  final String? name;
  final String? star;
  final String? sold;
  final String? price;

  @override
  State<GridCard> createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemContentScreen(
                      itemName: widget.name,
                    )));
      },
      child: GridTile(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.image!),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(60)),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? FontAwesome.heart
                            : FontAwesome.heart_empty,
                        color: const Color(0xff8bad1c),
                        size: 20,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.name!,
                  style: ThemeStyle.subHeader,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star_half,
                    size: 20,
                  ),
                  Text(
                    widget.star!,
                    style: ThemeStyle.subHeader,
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Text(
                      widget.sold!,
                      style: ThemeStyle.subHeader,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.price!,
                  style: ThemeStyle.subHeader,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
