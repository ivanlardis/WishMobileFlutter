import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:with_flutter/presentation/main/MainPresenter.dart';

class MainView extends StatefulWidget {
  @override
  createState() => new MainState();
}


class MainState extends State<MainView> {
  MainPresenter presenter;

    MainStateModel state  = MainStateModel();
  @override
  void initState() {
    super.initState();
    presenter = new MainPresenter(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    presenter = null;
  }

  @override
  void show(MainStateModel state) {
    setState(() {
       this.state = state;

    });
  }

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
                  "Быстрота нажатий", "Время (мс)", "Место в рейтинге ", state.timeUserBetweenPressed, state.placeUserBetweenPressed),
              Divider(),
              UserInfoView(
                  "Общее количество нажатий", "Количество", "Место в рейтинге ", state.countPressedUser, state.placePressedUser),
              Divider(),
              UserInfo2View("Все голоса", state.countAllCons, state.countAllProps),
              Divider(),
              UserInfo2View("Ваши голоса", state.countUserCons, state.countUserProps),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      presenter.handle(UIEvent.minus);
                    },
                    tooltip: 'Minus',
                    child: Icon(Icons.exposure_neg_1),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      presenter.handle(UIEvent.plus);
                    },
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




