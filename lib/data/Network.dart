import 'package:shared_preferences/shared_preferences.dart';
import 'package:with_flutter/data/Wish.dart';
import 'package:with_flutter/data/WishInfo.dart';
import 'package:with_flutter/utils/Prefs.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Network {
  static void saveWish(Wish wish) async {
    var body = json.encode(wish.toJson());

        await http.post('http://10.0.2.2:8888/wish', body: body, headers: {
      "Accept": "application/json",
      "Content-type": "application/json",
    });
  }

  static Future<Wish> loadWish() async {
    var response = await http.get('http://10.0.2.2:8888/wish');

    Map map = json.decode(response.body);

    Wish networkWish = Wish.fromJson(map);
    return networkWish;
  }

  static Future<WishInfo> loadWishInfo() async {
    var response = await http.get('http://10.0.2.2:8888/wishinfo');

    Map map = json.decode(response.body);

    WishInfo networkWish = WishInfo.fromJson(map);
    return networkWish;
  }
}
