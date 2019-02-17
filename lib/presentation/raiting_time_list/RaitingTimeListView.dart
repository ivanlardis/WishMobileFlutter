import 'dart:async';

import 'package:flutter/material.dart';

class RaitingTimeListView extends StatefulWidget {
  @override
  createState() => new RaitingTimeListState();
}

class RaitingTimeListState extends State<RaitingTimeListView> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Время между нажатиями"),
      ),
      body: Text("wewe"),
    );
  }
}
