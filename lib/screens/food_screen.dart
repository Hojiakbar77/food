import 'package:buttons_tabbar/buttons_tabbar.dart';

import 'package:flutter/material.dart';

import '../utils/const.dart';
import 'package:date_picker_timeline_fixed/date_picker_timeline_fixed.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  DateTime selectedValue = DateTime.now();

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Center(
          child: Text(
        'Домашняя еда',
        style: firstNameStyle,
      )),
      backgroundColor: colorWhite,
    );
  }

  Widget itemTab(icon, String name) {
    return Tab(
        icon: Icon(
          icon,
          color: colorOrange,
        ),
        text: name);
  }

  builtTabBar() {
    return DefaultTabController(
        length: 4,
        child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: colorWhite,
                  child: DatePicker(DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: colorWhite,
                      selectedTextColor: colorOrange, onDateChange: (date) {
                    // New date selected
                    setState(() {
                      selectedValue = date;
                    });
                  }))),
          ButtonsTabBar(
              backgroundColor: colorDark1,
              labelStyle: const TextStyle(
                  color: colorWhite, fontWeight: FontWeight.bold),
              tabs: [
                itemTab(Icons.palette, 'Все категории '),
                itemTab(Icons.soup_kitchen_sharp, 'Первое '),
                itemTab(Icons.fastfood, 'Второе'),
                itemTab(Icons.emoji_food_beverage_outlined, 'чай/кофе')
              ]),
          Expanded(
              child: TabBarView(children: <Widget>[
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(children: [
                      builtFood(context, 'assets/images/food1.jpg',
                          'Азиза Каримова', '4.5', '12'),
                      buildPosition('assets/images/avatar1.png')
                    ])),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(children: [
                    builtFood(context, 'assets/images/food1.jpg',
                        'Татяна Ракитина', '4.5', '10'),
                    buildPosition('assets/images/avatar1.png')
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(children: [
                    builtFood(context, 'assets/images/food1.jpg',
                        'Гулзода Зокирова', '20', '15'),
                    buildPosition('assets/images/avatar1.png')
                  ]),
                ),
              ]),
            ),
            buildCenter(Icons.soup_kitchen_sharp),
            buildCenter(Icons.fastfood),
            buildCenter(Icons.soup_kitchen_sharp)
          ]))
        ]));
  }

  Widget builtFood(context, String image, name, assessment, price) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 2.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: colorWhite,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                width: MediaQuery.of(context).size.width / 0.5,
                height: MediaQuery.of(context).size.height / 4.1,
                fit: BoxFit.fitWidth,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: firstNameStyle,
            ),
          ),
          Row(children: [
            Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width / 6.5,
                    height: MediaQuery.of(context).size.height / 25,
                    decoration: BoxDecoration(
                        color: colorGrey,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.star,
                          color: colorOrange,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(assessment)
                    ]))),
            Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width / 3.7,
                    height: MediaQuery.of(context).size.height / 25,
                    decoration: BoxDecoration(
                        color: colorGrey,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.local_taxi,
                          color: colorBlack,
                        ),
                      ),
                      const SizedBox(
                        width: 2.5,
                      ),
                      Text(
                        '$price 000 сум',
                        style: secondNameStyle,
                      ),
                      const SizedBox(
                        width: 1.5,
                      )
                    ])))
          ])
        ]));
  }

  Widget buildPosition(String image) {
    return Positioned.fill(
        right: 25,
        top: 90,
        child: Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            maxRadius: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width +
                50,
            backgroundImage: AssetImage(image),
          ),
        ));
  }

  Widget buildCenter(icon) {
    return Center(
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: builtTabBar(),
    );
  }
}
