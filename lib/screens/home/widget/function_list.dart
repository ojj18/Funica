import 'package:flutter/material.dart';
import 'package:funica/constants/theme_data.dart';
import '/screens/items/chair/chair_home.dart';
import '/screens/items/cubboard/cubboard_home.dart';
import '/screens/items/kitchen/kitchen_home.dart';
import '/screens/items/lamp/lamp_home.dart';
import '/screens/items/table/table_home.dart';
import '/screens/items/vase/vase_home.dart';

import '../../items/sofa/sofa.dart';

class FunctionList extends StatelessWidget {
  const FunctionList({this.labelIcon, this.labelText, super.key});

  final String? labelIcon;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (labelText) {
          case "Sofa":
            Navigator.pushReplacementNamed(
              context,
              SofaHomeScreen.routeName,
            );
            break;
          case "Chair":
            Navigator.pushReplacementNamed(
              context,
              ChairHomeScreen.routeName,
            );
            break;
          case "Cupboard":
            Navigator.pushReplacementNamed(
              context,
              CubboardHomeScreen.routeName,
            );
            break;
          case "Kitchen":
            Navigator.pushReplacementNamed(
              context,
              KitchenHomeScreen.routeName,
            );
            break;
          case "Table":
            Navigator.pushReplacementNamed(
              context,
              TableHomeScreen.routeName,
            );
            break;
          case "Lamp":
            Navigator.pushReplacementNamed(
              context,
              LampHomeScreen.routeName,
            );
            break;
          case "Vase":
            Navigator.pushReplacementNamed(
              context,
              VaseHomeScreen.routeName,
            );
            break;
        }
      },
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Image(
                image: AssetImage(labelIcon!),
                color: Colors.black,
                height: 25,
                width: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            labelText!,
            style: ThemeStyle.subHeader,
          )
        ],
      ),
    );
  }
}
