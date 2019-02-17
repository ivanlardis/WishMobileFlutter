import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  createState() => new MainState();
}


class MainState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Счетчик"),
        ),
        body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              UserInfoView(
                  "Нажатий за минуту", "Количество", "Место в рейтинге ", 4, 4),
              Divider(),
              UserInfoView(
                  "Время между нажатиями", "Время", "Место в рейтинге ", 4, 4),
              Divider(),
              UserInfo2View("Все голоса", 3, 6),
              Divider(),
              UserInfo2View("Ваши голоса", 15, 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Minus',
                    child: Icon(Icons.exposure_neg_1),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Plus',
                    child: Icon(Icons.exposure_plus_1),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class UserInfoView extends StatelessWidget {
  UserInfoView(this.title, this.item1Title, this.item2Title, this.item1Value,
      this.item2Value);

  String title;
  String item1Title;
  String item2Title;
  int item1Value;
  int item2Value;

  var style = TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(title, style: TextStyle(fontSize: 24,color: Colors.blue)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(item1Title, style: style),
          Text("${item1Value}", style: style),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(item2Title, style: style),
          Text("${item2Value}", style: style),
        ],
      ),
    ]);
  }
}

class UserInfo2View extends StatelessWidget {
  UserInfo2View(this.title, this.countCons, this.countProps);

  String title;
  int countCons;
  int countProps;

  var style = TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(title, style: TextStyle(fontSize: 24,color: Colors.blue)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Против", style: style),
          Text("За", style: style),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("${countCons}", style: style),
          Text("${countProps - countCons}", style: style),
          Text("${countProps}", style: style),
        ],
      ),
    ]);
  }
}