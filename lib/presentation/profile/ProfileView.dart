import 'dart:async';

import 'package:flutter/material.dart';
import 'package:with_flutter/data/Network.dart';
import 'package:with_flutter/presentation/login/LoginView.dart';
import 'package:with_flutter/presentation/registration/Registration.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:with_flutter/utils/Prefs.dart';

class ProfileView extends StatefulWidget {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfileView(this._scaffoldKey);

  @override
  createState() => new ProfileState(_scaffoldKey);
}

class ProfileState extends State<ProfileView> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileState(this._scaffoldKey);
  var name="";
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
   SharedPreferences.getInstance().then((prefs){
     var name = prefs.getString(Prefs.USER_NAME.toString()) ?? "";


     setState(() {
       this.name = name;
     });

   });


  }

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
                  icon: Icon(Icons.account_circle),
                  onPressed: null),
              Text(
                name,
                style: TextStyle(fontSize: 26),
              ),
              FlatButton(
                textColor: Colors.blue,
                onPressed: () {
                  logout();
                },
                child: Text("Выйти"),
              ),
            ],
          ))),
    );
  }

  void logout() async {
    Network.logout();

    Navigator.pushReplacement(
      _scaffoldKey.currentContext,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }
}
