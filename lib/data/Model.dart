import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/presentation/main/MainPresenter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Model {
  final subject = BehaviorSubject<MainStateModel>();

  static Database database;

  static void init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "demo.db");

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute("CREATE TABLE Wishes"
          " (time INTEGER PRIMARY KEY, "
          "value INTEGER, "
          "timeAfterLastPress INTEGER)");
    });

    var timerObservable = Observable.periodic(Duration(seconds: 1));
    timerObservable.listen((i) => save());
  }

  static void save() async {
    Wish wish = Wish(timeAfterLastPress: 3, value: 4, time: 4);



    var body = json.encode(wish.toJson());
    var test =
        await http.post('http://10.0.2.2:8888/wish', body: body,

          headers: {"Accept": "application/json","Content-type": "application/json",});

    print(test.request.toString());
    print(body);
    print(test.body);
  }

  static int timeLastPress = 0;

  static void addWish(int value) async {
    if (database != null) {
      await database.transaction((txn) async {
        var timeNow = DateTime.now().millisecondsSinceEpoch;
        var timeAfterLastPress = timeNow - timeLastPress;
        timeLastPress = timeNow;

        int id1 = await txn
            .rawInsert('INSERT INTO Wishes(time, value,  timeAfterLastPress) '
                'VALUES'
                '( ${timeNow},'
                '${value},'
                '"${timeAfterLastPress}" )');
      });
    }
  }

  static Future<List<Wish>> getWish() async {
    print("getData");
    var completer = new Completer<List<Wish>>();

    if (database != null) {
      List<Map> list = await database.rawQuery('SELECT * FROM Wishes');
      print("getData ${list}");
      List<Wish> listWish = mapper(list);

      completer.complete(listWish);
      return completer.future;
    } else {
      completer.complete(new List());
      return completer.future;
    }
  }

  static List<Wish> mapper(List map) {
    List<Wish> models = new List();

    void iterateMapEntry(value) {
      Wish history = Wish.fromJson(value);
      models.add(history);
    }

    map.forEach(iterateMapEntry);
    return models;
  }
}

class DataModel {
  int wishCountUserCons = 0;
  int wishCountAllProps = 0;
  int wishCountUserProps = 0;
  int wishCountAllCons = 0;
}

class Wish {
  int timeAfterLastPress;
  int value;
  int time;

  Wish({this.timeAfterLastPress, this.value, this.time});

  factory Wish.fromJson(Map<String, dynamic> json) {
    return Wish(
        timeAfterLastPress: json['timeAfterLastPress'],
        value: json['value'],
        time: json['time']);
  }

  Map<String, dynamic> toJson() =>
      {'timeAfterLastPress': timeAfterLastPress, 'value': value, 'time': time};
}
