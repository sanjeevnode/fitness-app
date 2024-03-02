import 'package:fitfusion/constant.dart';
import 'package:fitfusion/custom.dart';
import 'package:fitfusion/screens/home/home.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

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
              const Field(text: "Enter your age", icon: Icons.cake),
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
              const Field(text: "Enter your height", icon: Icons.height),
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
              const Field(text: "Enter your weight", icon: Icons.line_weight),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
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
