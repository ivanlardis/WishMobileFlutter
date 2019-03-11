import 'dart:async';

import 'package:flutter/material.dart';
import 'package:with_flutter/data/Repository.dart';
import 'package:with_flutter/models/WishFull.dart';

class RaitingCountListView extends StatefulWidget {
  @override
  createState() => new RaitingCountListState();
}

class RaitingCountListState extends State<RaitingCountListView> {
  var wishsFull = new List<WishFull>();
  int ownerId;

  @override
  void initState() {
    Repository.subject.listen((data) {
      print("RaitingCountListState");
      setState(() {
        data.wishsFull.sort((a, b) {
          if (a.getAllCountPressed() < b.getAllCountPressed()) {
            return 1;
          } else {
            return -1;
          }
        });
        ownerId = data.ownerId;
        wishsFull = data.wishsFull;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Кол-во нажатий"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: wishsFull.length * 2,
          itemBuilder: (BuildContext context, int i) {
            if (i.isOdd) return new Divider();
            final index = i ~/ 2;

            return RaitingCountListItem(index + 1, ownerId, wishsFull[index]);
          },
        ),
      ),
    );
  }
}

class RaitingCountListItem extends StatelessWidget {
  int position;
  int ownerId;

  WishFull wishFull;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "${position}.${wishFull.userName}",
          style: TextStyle(
              fontSize: 24,
              color: ownerId != wishFull.id ? Colors.blue : Colors.pink),
        ),
        Text(
          "${wishFull.countCons + wishFull.countProps} раз",
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  RaitingCountListItem(this.position, this.ownerId, this.wishFull);
}
