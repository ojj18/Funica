import 'package:flutter/material.dart';
import 'package:funica/constants/theme_data.dart';
import '../navigation.dart';
import '/models/special_offer_model.dart';

class SpecialOfferScreen extends StatelessWidget {
  const SpecialOfferScreen({super.key, this.title, this.specialOfferList});
  static const routeName = "SpecialOfferScreen/";

  final String? title;
  final List<SpecialOfferModel>? specialOfferList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MyNavigation.routeName);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff8bad1c),
          ),
        ),
        title: Text(
          title!,
          style: ThemeStyle.headerText,
        ),
      ),
      body: ListView.builder(
          itemCount: specialOfferList!.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.all(20),
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          specialOfferList![index].discount!,
                          style: ThemeStyle.header_1,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            specialOfferList![index].deals!,
                            style: ThemeStyle.header_5,
                          ),
                        ),
                        Text(
                          specialOfferList![index].desc!,
                          style: ThemeStyle.header_6,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image(
                        image: AssetImage(specialOfferList![index].image!)),
                  )
                ],
              ),
            );
          })),
    );
  }
}
