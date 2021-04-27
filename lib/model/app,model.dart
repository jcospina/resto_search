import 'package:flutter/foundation.dart';
import 'package:restaurant_search/model/user.model.dart';

enum FormType { REGISTER, LOGIN }

class MyAppState extends ChangeNotifier {
  bool loginIn = false;
  User currentUser;

  setLoginState(bool state) {
    loginIn = state;
    notifyListeners();
  }
}
