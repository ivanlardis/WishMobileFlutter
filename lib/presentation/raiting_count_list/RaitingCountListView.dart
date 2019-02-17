import 'dart:async';

import 'package:flutter/material.dart';

class RaitingCountListView extends StatefulWidget {
  @override
  createState() => new RaitingCountListState();
}

class RaitingCountListState extends State<RaitingCountListView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Кол-во нажатий за мин"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 10 * 2,
          itemBuilder: (BuildContext context, int i) {
            if (i.isOdd) return new Divider();
            final index = i ~/ 2;

            return RaitingCountListItem(index+1);
          },
        ),
      ),
    );
  }
}

class RaitingCountListItem extends StatelessWidget {

  int position;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "${position}.Иван",
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
        Text(
          "10 раз",
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  RaitingCountListItem(this.position);
}
