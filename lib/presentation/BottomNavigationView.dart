import 'package:flutter/material.dart';
import 'package:with_flutter/presentation/login/LoginView.dart';
import 'package:with_flutter/presentation/main/MainView.dart';
import 'package:with_flutter/presentation/profile/ProfileView.dart';
import 'package:with_flutter/presentation/raiting_count_list/RaitingCountListView.dart';
import 'package:with_flutter/presentation/raiting_time_list/RaitingTimeListView.dart';

class BottomNavigationView extends StatefulWidget {
  @override
  createState() => new BottomNavigationViewState();
}

class BottomNavigationViewState extends State<BottomNavigationView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new TickerMode(
              enabled: index == 0,
              child: new MaterialApp(home: new MainView()),
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child: new MaterialApp(home: new RaitingCountListView()),
            ),
          ),
          new Offstage(
            offstage: index != 2,
            child: new TickerMode(
              enabled: index == 2,
              child: new MaterialApp(home: new RaitingTimeListView()),
            ),
          ),
          new Offstage(
            offstage: index != 3,
            child: new TickerMode(
              enabled: index == 3,
              child: new MaterialApp(home: new ProfileView()),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.accessibility),
            title: new Text("Кликер"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.equalizer),
            title: new Text("Количество"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.equalizer),
            title: new Text("Быстрота"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle),
            title: new Text("Профиль"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {

  }
}
