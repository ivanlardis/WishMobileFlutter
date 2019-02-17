import 'dart:async';

import 'package:flutter/material.dart';
import 'package:with_flutter/presentation/login/LoginView.dart';

class ProfileView extends StatefulWidget {
  @override
  createState() => new ProfileState();
}
class ProfileState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Профиль"),
      ),
      body: Container(
          margin: EdgeInsets.all(36),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      iconSize: 86,
                      icon: Icon(Icons.account_circle), onPressed: null),
                  Text("Имя Иван",
                    style: TextStyle(fontSize: 26),

                  ),


                  FlatButton(

                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationView()),
                      );
                    },
                    child: Text("Выйти"),
                  ),
                ],
              ))),
    );
  }
}