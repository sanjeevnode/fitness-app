import 'dart:convert';

import 'package:fitfusion/global_variables.dart';

import 'package:fitfusion/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  static void createUser(
    String name,
    String gender,
    int age,
    int height,
    double weight,
    BuildContext context,
  ) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'gender': gender,
          'age': age,
          'height': height,
          'weight': weight,
        }),
      );

      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
          'user',
          jsonDecode(response.body)['_id'],
        );

        print(prefs.getString('user'));
        Provider.of<UserProvider>(context, listen: false).setUser(
          response.body,
        );
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
