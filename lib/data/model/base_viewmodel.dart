import 'package:flutter/foundation.dart';
import 'package:flutterlpsetest/data/model/view_state.dart';

class BaseViewModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    if (kDebugMode) {
      print('State:$viewState');
    }
    _state = viewState;
    notifyListeners();
  }

  set stateWithoutUpdate(ViewState viewState) {
    if (kDebugMode) {
      print('State:$viewState');
    }
    _state = viewState;
  }

  void update() {
    notifyListeners();
  }
}
