import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  createState() => LoginState();
}

class LoginState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                decoration: InputDecoration(hintText: 'Логин'),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Пароль'),
              ),
              FlatButton(
                textColor: Colors.blue,
                onPressed: () {},
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
                child: Text("Зарегистрироваться"),
              ),
            ],
          ))),
    );
  }
}

class RegistrationView extends StatefulWidget {
  @override
  createState() => RegistrationState();
}

class RegistrationState extends State<RegistrationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    decoration: InputDecoration(hintText: 'Логин'),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Пароль'),
                  ),

                  FlatButton(

                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationView()),
                      );
                    },
                    child: Text("Зарегистрироваться"),
                  ),
                ],
              ))),
    );
  }
}