import 'package:fitfusion/constant.dart';
import 'package:fitfusion/screens/home/about.dart';
import 'package:fitfusion/shared/custom_textfield.dart';
import 'package:flutter/material.dart';

class SetProfile extends StatefulWidget {
  const SetProfile({super.key});

  @override
  State<SetProfile> createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

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
              Image.asset('assets/profile.png', height: 280),
              const Text(
                textAlign: TextAlign.center,
                'Set your profile',
                style: TextStyle(
                  color: textColors,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                textAlign: TextAlign.center,
                'Welcome to your journey towards better health and fitness',
                style: TextStyle(
                  color: textColors3,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'NAME',
                style: TextStyle(
                  color: textColors, // Set the color
                  fontSize: 16, // Set the font size
                  fontWeight: FontWeight.w500, // Set the font weight
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: nameController,
                hintText: "Name",
              ),
              const SizedBox(height: 20),
              const Text(
                'Gender',
                style: TextStyle(
                  color: textColors, // Set the color
                  fontSize: 16, // Set the font size
                  fontWeight: FontWeight.w500, // Set the font weight
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: genderController,
                hintText: "Gender",
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      genderController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => About(
                          name: nameController.text,
                          gender: genderController.text,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all the fields'),
                      ),
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
