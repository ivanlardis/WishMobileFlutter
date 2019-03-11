import 'package:with_flutter/data/Repository.dart';
import 'package:with_flutter/models/WishInfo.dart';
import 'package:with_flutter/presentation/main/MainView.dart';

class MainPresenter {
  MainState view;
  MainStateModel stateModel = MainStateModel();

  MainPresenter(this.view) {
    Repository.subject.listen((data) => this.update(data));
  }

  void update(WishsInfo data) {
    print("update presenter");
    var action = MainAction(type: TypeMainAction.updateData, data: data);
    reducer(action);
  }

  void handle(UIEvent wish) async {
    switch (wish) {
      case UIEvent.plus:
        {
          print("teee");

          reducer(MainAction(type: TypeMainAction.plus, data: null));
        }
        break;

      case UIEvent.minus:
        {
          reducer(MainAction(type: TypeMainAction.minus, data: null));
        }
        break;
    }
  }

  void reducer(MainAction action) {
    switch (action.type) {
      case TypeMainAction.plus:
        {
          stateModel.countUserProps =  stateModel.countUserProps + 1;
          Repository.updateWish(stateModel);
        }
        break;

      case TypeMainAction.minus:
        {
         stateModel.countUserCons = stateModel.countUserCons + 1;
          Repository.updateWish(stateModel);
        }
        break;
      case TypeMainAction.updateData:
        {
          var data = action.data;

          if (data != null) {
            stateModel.countAllProps = data.countAllProps;
            stateModel.countAllCons = data.countAllCons;

            if (stateModel.countUserCons < data.countUserCons) {
              stateModel.countUserCons = data.countUserCons;
            }

            if (stateModel.countUserProps < data.countUserProps) {
              stateModel.countUserProps = data.countUserProps;
            }

            var wish = data.wishsFull;
            wish.sort((a, b) =>
                (a.timeAfterLastPress) > (b.timeAfterLastPress) ? 1 : -1);

            stateModel.placeUserBetweenPressed =
                wish.indexWhere((element) => element.id == data.ownerId)+1;

            var owner =
                wish.firstWhere((element) => element.id == data.ownerId);
            stateModel.timeUserBetweenPressed = owner.timeAfterLastPress;
            stateModel.countPressedUser = owner.countProps + owner.countCons;


            wish.sort((a, b) =>
            (a.getAllCountPressed()) < (b.getAllCountPressed()) ? 1 : -1);

            stateModel.placePressedUser =
                wish.indexWhere((element) => element.id == data.ownerId)+1;

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
  WishsInfo data;

  MainAction({this.type, this.data});
}

class MainStateModel {
  int countUserCons = 0;
  int countAllProps = 0;
  int countUserProps = 0;
  int countAllCons = 0;

  int countPressedUser = 0;
  int placePressedUser = 0;
  int timeUserBetweenPressed = 0;
  int placeUserBetweenPressed = 0;
}
