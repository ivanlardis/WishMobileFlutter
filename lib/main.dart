import 'package:flutter/material.dart';
import 'package:with_flutter/data/Network.dart';
import 'package:with_flutter/data/Repository.dart';
import 'package:with_flutter/presentation/BottomNavigationView.dart';
import 'package:with_flutter/presentation/login/LoginView.dart';

void main() {
  Repository.init();
  Network.isLogin().then((bool){

    runApp(new ThemeApp(bool));

  });


}
class ThemeApp extends StatelessWidget {

  bool isLogin  = false;
  ThemeApp(this.isLogin);


  @override
  Widget build(BuildContext context) {

    if(isLogin){
      return new MaterialApp(

        home:   BottomNavigationView(),
        theme: ThemeData.dark(),
      );
    } else {
      return new MaterialApp(

        home:   LoginView(),
        theme: ThemeData.dark(),
      );
    }




  }
}
