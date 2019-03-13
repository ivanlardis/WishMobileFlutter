import 'package:shared_preferences/shared_preferences.dart';
import 'package:with_flutter/models/Token.dart';
import 'package:with_flutter/models/User.dart';
import 'package:with_flutter/models/Wish.dart';
import 'package:with_flutter/models/WishInfo.dart';
import 'package:with_flutter/utils/Prefs.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Network {


  static var url ="http://34.73.164.26:8888";
  static void saveWish(Wish wish) async {
    var body = json.encode(wish.toJson());
    var authorization = await getAuthorization();
    await http.post('$url/wish', body: body, headers: {
      "Accept": "application/json",
      "Content-type": "application/json",
      "Authorization": authorization,
    });
  }

  static Future<Map<String, String>> getHeaders() async {
    var authorization = await getAuthorization();
    var headers = {"Authorization":  authorization};
    return headers;
  }

  static Future<String> getAuthorization() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(Prefs.TOKEN.toString()) ?? "";
    return "Bearer ${token}";
  }

  static Future<WishsInfo> loadWishInfo() async {
    var headers = await getHeaders();

    var response =
        await http.get('$url/wishinfo', headers: headers);

    print("loadWishInfo body ${response.body}");
    Map map = json.decode(response.body);

    WishsInfo networkWish = WishsInfo.fromJson(map);
    return networkWish;
  }

  static Future<bool> registation(User user) async {
    print("registation");
    var body = json.encode(user.toJson());

    var authorization = await getAuthorization();
    var response = await http.post('$url/register',
        body: body,
        headers: {
          "Content-type": "application/json",
          "Authorization": authorization
        });

    print(response.statusCode);
    print(response.body);
    return response.statusCode == 200;
  }

  static Future<bool> login(User user) async {
    print("login");
    final clientID = "com.lardis.wish";
    final body =
        "username=${user.username}&password=${user.password}&grant_type=password";
    final clientCredentials = Base64Encoder().convert("$clientID:".codeUnits);

    var response = await http
        .post('$url/auth/token', body: body, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Basic $clientCredentials"
    });

    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      Token token = Token.fromJson(map);

      print("token = ${token.access_token}");

      var prefs = await SharedPreferences.getInstance();
      prefs.setString(Prefs.TOKEN.toString(), token.access_token);
      prefs.setString(Prefs.USER_NAME.toString(), user.username);
    }

    print(response.statusCode);
    print(response.body);
    return response.statusCode == 200;
  }

  static Future<bool> isLogin() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(Prefs.TOKEN.toString()) ?? "";

    return (token.length > 0);
  }

  static void logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(Prefs.TOKEN.toString(), "");
  }
}
