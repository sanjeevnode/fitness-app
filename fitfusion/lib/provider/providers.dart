import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String get userId => '';

  void setUserId(String userId) {
    userId = userId;
    notifyListeners();
  }
}
