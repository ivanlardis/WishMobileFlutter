import 'package:with_flutter/data/Model.dart';
import 'package:with_flutter/presentation/main/MainView.dart';

class MainPresenter {
  MainState view;
  MainStateModel stateModel = MainStateModel();

  MainPresenter(this.view);

  void handle(UIEvent wish) async {
    switch (wish) {
      case UIEvent.plus:
        {
          print("teee");
          await Model.addWish(1);
          reducer(MainAction(TypeMainAction.plus, null));
        }
        break;

      case UIEvent.minus:
        {
          await Model.addWish(1);
          reducer(MainAction(TypeMainAction.minus, null));
        }
        break;
    }
  }

  void reducer(MainAction action) {
    switch (action.type) {
      case TypeMainAction.plus:
        {
          stateModel.wishCountUserProps = stateModel.wishCountUserProps + 1;
        }
        break;

      case TypeMainAction.minus:
        {
          stateModel.wishCountUserCons = stateModel.wishCountUserCons + 1;
        }
        break;
      case TypeMainAction.updateData:
        {
          var data = action.data;

          if (data != null) {
            stateModel.wishCountUserCons = data.wishCountUserCons;
            stateModel.wishCountUserProps = data.wishCountUserProps;
            stateModel.wishCountAllProps = data.wishCountAllProps;
            stateModel.wishCountAllCons = data.wishCountAllCons;
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
  DataModel data;

  MainAction(this.type, this.data);
}


class MainStateModel {
  int wishCountUserCons = 0;
  int wishCountAllProps = 0;
  int wishCountUserProps = 0;
  int wishCountAllCons = 0;
}
