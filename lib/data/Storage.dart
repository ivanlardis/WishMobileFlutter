import 'package:shared_preferences/shared_preferences.dart';
import 'package:with_flutter/models/Wish.dart';
import 'package:with_flutter/utils/Prefs.dart';

class Storage {
  static void saveWish(Wish wish) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(Prefs.WISH_COUNT_USER_CONS.toString(), wish.countCons);
    prefs.setInt(Prefs.WISH_COUNT_USER_PROPS.toString(), wish.countProps);
    prefs.setInt(
        Prefs.TIME_AFTER_LAST_PRESS.toString(), wish.timeAfterLastPress);
  }

  static Future<Wish> loadWish() async {
    var prefs = await SharedPreferences.getInstance();

    int countCons =await prefs.getInt(Prefs.WISH_COUNT_USER_CONS.toString()) ?? 0;
    int countProps = await prefs.getInt(Prefs.WISH_COUNT_USER_PROPS.toString()) ?? 0;
   int timeAfterLastPress = await
       prefs.getInt(Prefs.TIME_AFTER_LAST_PRESS.toString()) ?? 0;

    return Wish(
        timeAfterLastPress: timeAfterLastPress,
        countCons: countCons,
        countProps: countProps);
  }
}
