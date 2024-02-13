import 'package:fitfusion/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    name: "",
    age: 0,
    height: 0,
    weight: 0.0,
    email: "",
    gender: "",
    workouts: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
