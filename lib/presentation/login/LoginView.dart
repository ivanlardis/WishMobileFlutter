import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:with_flutter/data/Network.dart';
import 'package:with_flutter/models/User.dart';
import 'package:with_flutter/presentation/BottomNavigationView.dart';
import 'package:with_flutter/presentation/registration/Registration.dart';
import 'package:with_flutter/utils/Prefs.dart';

class LoginView extends StatefulWidget {
  @override
  createState() => LoginState();
}

class LoginState extends State<LoginView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String username = "";
  String password = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Вход"),
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
                decoration: InputDecoration(
                  hintText: 'Логин',
                ),
              ),
              TextField(
                onChanged: (text) {
                  password = text;
                },
                decoration: InputDecoration(hintText: 'Пароль'),
              ),
              FlatButton(
                textColor: Colors.blue,
                onPressed: () => _loginUser(
                    User(username: username, password: password), context),
                child: Text("Войти"),
              ),
              FlatButton(
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationView()),
                  );
                },
                child: Text("Регистрация"),
              ),
            ],
          ))),
    );
  }

  void _loginUser(User user, BuildContext context) async {
    if (user.username.length < 3 || user.password.length < 3) {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("Длина пароля и логина от 3 знаков"),
      ));
      return;
    }

    print("_loginUser");
    var success = await Network.login(user);

    if (success) {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("Пользователь успешно вошел"),
      ));

      Navigator.pushReplacement(
        _scaffoldKey.currentContext,
        MaterialPageRoute(builder: (context) => BottomNavigationView()),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("Ошибка входа"),
      ));
    }
  }
}
