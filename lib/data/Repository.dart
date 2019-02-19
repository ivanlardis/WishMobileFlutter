import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/data/Storage.dart';
import 'package:with_flutter/data/Network.dart';
import 'package:with_flutter/data/WishInfo.dart';

class Repository {
  static final subject = BehaviorSubject<WishInfo>();

  static void init() async {

    var timerObservable = Observable.periodic(Duration(seconds: 1));
    timerObservable.listen((i) => syncWithNetwork());
  }

  static void syncWithNetwork() async {


    var networkWishInfo = await Network.loadWishInfo();
    subject.add(networkWishInfo);
  }

  static void incrementCons() async {
    var wish = await Storage.loadWish();
    wish.countCons = wish.countCons + 1;

  }

  static void incrementProps() async {
    var wish = await Storage.loadWish();
    wish.countProps = wish.countProps + 1;

  }
}
