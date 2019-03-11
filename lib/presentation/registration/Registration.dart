import 'package:flutter/material.dart';
import 'package:with_flutter/data/Network.dart';
import 'package:with_flutter/models/User.dart';

class RegistrationView extends StatefulWidget {
  @override
  createState() => RegistrationState();
}

class RegistrationState extends State<RegistrationView> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String username ="";
  String password ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Регистрация"),
      ),
      body: Container(
          margin: EdgeInsets.all(36),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  username = text;
                },
                decoration: InputDecoration(hintText: 'Логин'),
              ),
              TextField(
                onChanged: (text) {
                  password = text;
                },
                decoration: InputDecoration(hintText: 'Пароль'),
              ),
              FlatButton(
                textColor: Colors.blue,
                onPressed: () =>
                    _refistrationUser(User(
                   username: username ,
                   password: password ),  context),
                child: Text("Зарегистрироваться"),
              ),
            ],
          ))),
    );
  }

  void _refistrationUser(User user,BuildContext context) async {

   var success = await Network.registation(user);

   if(success){
     _scaffoldKey.currentState.showSnackBar(new SnackBar(
       content: new Text("Пользователь успешно зарегистрирован"),
     ));

     Navigator.pop(_scaffoldKey.currentContext);
   } else {

     _scaffoldKey.currentState.showSnackBar(new SnackBar(
       content: new Text("Дубликат пользователя"),
     ));
   }



  }
}
