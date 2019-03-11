import 'package:rxdart/rxdart.dart';
import 'package:with_flutter/data/Storage.dart';
import 'package:with_flutter/data/Network.dart';
import 'package:with_flutter/models/Wish.dart';
import 'package:with_flutter/models/WishInfo.dart';
import 'package:with_flutter/presentation/main/MainPresenter.dart';

class Repository {
  static final subject = PublishSubject<WishsInfo>();

  static void init() async {
    var timerObservable = Observable.periodic(Duration(seconds: 1));


    timerObservable.listen((i) {
      Network.isLogin().then((bool) {
        if(bool){
          syncWithNetwork();
        }


      });
    });
  }

  static void syncWithNetwork() async {
    var networkWishInfo = await Network.loadWishInfo();
    subject.add(networkWishInfo);
  }


  static int lastTime = 0;
  static void updateWish(MainStateModel mainStaitModel) async {


    int currentTime = DateTime.now().millisecondsSinceEpoch;

    var wish = Wish(timeAfterLastPress:currentTime-lastTime,
        countProps: mainStaitModel.countUserProps,
        countCons :mainStaitModel.countUserCons);

    lastTime = currentTime;
    Network.saveWish(wish);
  }


}
