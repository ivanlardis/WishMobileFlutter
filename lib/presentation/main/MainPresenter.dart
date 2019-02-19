import 'package:with_flutter/data/Repository.dart';
import 'package:with_flutter/data/WishInfo.dart';
import 'package:with_flutter/presentation/main/MainView.dart';

class MainPresenter {
  MainState view;
  MainStateModel stateModel = MainStateModel();

  MainPresenter(this.view) {
    Repository.subject.listen((data) => this.update(data));
  }

  void update(WishInfo data) {
    print("update presenter");
    var action = MainAction(type: TypeMainAction.updateData, data: data);
    reducer(action);
  }

  void handle(UIEvent wish) async {
    switch (wish) {
      case UIEvent.plus:
        {
          print("teee");
          await Repository.incrementProps();
          reducer(MainAction(type: TypeMainAction.plus, data: null));
        }
        break;

      case UIEvent.minus:
        {
          await Repository.incrementCons();
          reducer(MainAction(type: TypeMainAction.minus, data: null));
        }
        break;
    }
  }

  void reducer(MainAction action) {
    switch (action.type) {
      case TypeMainAction.plus:
        {
          stateModel.countUserProps = stateModel.countUserProps + 1;
        }
        break;

      case TypeMainAction.minus:
        {
          stateModel.countUserCons = stateModel.countUserCons + 1;
        }
        break;
      case TypeMainAction.updateData:
        {
          var data = action.data;

          if (data != null) {
            stateModel.countAllProps = data.countAllProps;
            stateModel.countAllCons = data.countAllCons;
          }
        }
    }

    view.show(stateModel);
  }
}

enum UIEvent { minus, plus }

enum TypeMainAction { minus, plus, updateData }

class MainAction {
  TypeMainAction type;
  WishInfo data;

  MainAction({this.type, this.data});
}

class MainStateModel {
  int countUserCons = 0;
  int countAllProps = 0;
  int countUserProps = 0;
  int countAllCons = 0;
}
