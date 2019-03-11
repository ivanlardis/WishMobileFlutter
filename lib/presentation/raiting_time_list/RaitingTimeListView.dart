import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:with_flutter/data/Repository.dart';
import 'package:with_flutter/models/WishFull.dart';

class RaitingTimeListView extends StatefulWidget {
  @override
  createState() => new RaitingTimeListState();
}

class RaitingTimeListState extends State<RaitingTimeListView> {
  var wishsFull = new List<WishFull>();
  int ownerId;

  @override
  void initState() {
    Repository.subject.listen((data) {
      print("RaitingCountListState");
      setState(() {

        wishsFull = data.wishsFull
            .where((wish) => wish.timeAfterLastPress != 0)
            .toList();

         wishsFull.sort(
                (a, b) => (a.timeAfterLastPress) > (b.timeAfterLastPress) ? 1 : -1);
        ownerId = data.ownerId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Быстрота нажатий"),
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
          "${wishFull.timeAfterLastPress} мс",
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  RaitingCountListItem(this.position, this.ownerId, this.wishFull);
}
