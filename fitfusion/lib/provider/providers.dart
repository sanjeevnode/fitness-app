import 'package:fitfusion/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: "",
    name: "",
    age: 0,
    height: 0,
    weight: 0.0,
    email: "",
    gender: "",
    bmi: "",
    bmiRange: "",
    workouts: {},
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void resetUser() {
    _user = User(
      id: "",
      name: "",
      age: 0,
      height: 0,
      weight: 0.0,
      email: "",
      gender: "",
      bmi: "",
      bmiRange: "",
      workouts: {},
    );
    notifyListeners();
  }
}

class GlobalProvider extends ChangeNotifier {
  String _userid = "";

  String get userid => _userid;

  void setUserid(String userid) {
    _userid = userid;
    notifyListeners();
  }

  void resetUserid() {
    _userid = "";
    notifyListeners();
  }
}
