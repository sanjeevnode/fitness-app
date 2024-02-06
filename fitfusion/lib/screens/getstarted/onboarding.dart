// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:fitfusion/global_variables.dart';
import 'package:fitfusion/shared/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:fitfusion/shared/custom_textfield.dart';
import 'package:http/http.dart' as http;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _signUpFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _nameController,
                    hintText: "Name",
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _ageController,
                    hintText: "Age",
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _heightController,
                    hintText: "Height",
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _weightController,
                    hintText: "Weight",
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _genderController,
                    hintText: "Gender",
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: "Save",
                    onTap: () async {
                      if (_signUpFormKey.currentState!.validate()) {
                        try {
                          http.Response response = await http.post(
                            Uri.parse("$uri/api/user"),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode({
                              "name": _nameController.text,
                              "age": int.parse(_ageController.text),
                              "height": int.parse(_heightController.text),
                              "weight": int.parse(_weightController.text),
                              "gender": _genderController.text,
                            }),
                          );
                          if (response.statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Column(
                                children: [
                                  const Text("User created successfully"),
                                  Text(response.body),
                                ],
                              )),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(response.body),
                              ),
                            );
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
