import 'package:flutter/material.dart';
import 'package:with_flutter/data/Repository.dart';
import 'package:with_flutter/presentation/BottomNavigationView.dart';

void main() {
  Repository.init();
  runApp(new ThemeApp());
}
class ThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

        home: new BottomNavigationView(),
      theme: ThemeData.dark(),
    );
  }
}
