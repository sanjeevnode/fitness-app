// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'dart:convert';

import 'package:fitfusion/constant.dart';

import 'package:fitfusion/global_variables.dart';
import 'package:fitfusion/provider/providers.dart';
import 'package:fitfusion/screens/home/home.dart';

import 'package:fitfusion/shared/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class About extends StatefulWidget {
  final String name;
  final String gender;
  const About({
    Key? key,
    required this.name,
    required this.gender,
  }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void createUser(
    String name,
    String gender,
    int age,
    int height,
    double weight,
    // BuildContext context,
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

        debugPrint(response.body);
        debugPrint(prefs.getString('user'));
        Provider.of<UserProvider>(context, listen: false).setUser(
          response.body,
        );

        debugPrint(
          Provider.of<UserProvider>(
            context,
            listen: false,
          ).user.toJson(),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          'Set Profile',
          style: TextStyle(color: textColors, fontSize: 20),
        ),
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundColor: popColors,
            child: Icon(
              Icons.arrow_back,
              color: textColors,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                textAlign: TextAlign.center,
                'Add More Details',
                style: TextStyle(
                  color: textColors,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                textAlign: TextAlign.center,
                'Welcome to your journey towards better health and fitness',
                style: TextStyle(
                  color: textColors3,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Age',
                style: TextStyle(
                  color: textColors, // Set the color
                  fontSize: 16, // Set the font size
                  fontWeight: FontWeight.w500, // Set the font weight
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(controller: ageController, hintText: "Age"),
              const SizedBox(height: 20),
              const Text(
                'Height',
                style: TextStyle(
                  color: textColors, // Set the color
                  fontSize: 16, // Set the font size
                  fontWeight: FontWeight.w500, // Set the font weight
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(controller: heightController, hintText: "Height"),
              const SizedBox(height: 20),
              const Text(
                'Weight',
                style: TextStyle(
                  color: textColors, // Set the color
                  fontSize: 16, // Set the font size
                  fontWeight: FontWeight.w500, // Set the font weight
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(controller: weightController, hintText: "Weight"),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (ageController.text.isNotEmpty &&
                      heightController.text.isNotEmpty &&
                      weightController.text.isNotEmpty) {
                    createUser(
                      widget.name,
                      widget.gender,
                      int.parse(ageController.text),
                      int.parse(heightController.text),
                      double.parse(weightController.text),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: popColors,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    color: textColors,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
