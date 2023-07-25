import 'package:flutter/material.dart';
import 'package:funica/constants/theme_data.dart';
import 'package:funica/screens/navigation.dart';
import '/constants/enum.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  static const routeName = '/LanguageScreen';
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Languages _languages = Languages.englishUS;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        title: const Text("Language", style: ThemeStyle.headerText),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MyNavigation.routeName);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff8bad1c),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Suggested",
                        style: ThemeStyle.headerText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'English (US)',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.englishUS,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'English (Uk)',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.englishUK,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Language",
                        style: ThemeStyle.headerText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Mandarin',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.mandarin,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Hindi',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.hindi,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Spanish',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.spanish,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'French',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.french,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Arabic',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.arabic,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Bengali',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.bengali,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Russian',
                              style: ThemeStyle.subHeader,
                            ),
                            Radio(
                              activeColor: const Color(0xff8bad1c),
                              value: Languages.russian,
                              groupValue: _languages,
                              onChanged: (Languages? value) {
                                setState(() {
                                  _languages = value!;
                                });
                              },
                            ),
                          ]),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Indonesia',
                            style: ThemeStyle.subHeader,
                          ),
                          Radio(
                            activeColor: const Color(0xff8bad1c),
                            value: Languages.indonesia,
                            groupValue: _languages,
                            onChanged: (Languages? value) {
                              setState(() {
                                _languages = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
