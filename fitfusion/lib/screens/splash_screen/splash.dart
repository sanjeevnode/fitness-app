import 'dart:async';

import 'package:fitfusion/constant.dart';
import 'package:fitfusion/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // Add a background color to the splash screen
        color: popColors,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add a logo to the splash screen
            Image(image: AssetImage('assets/f.png')),
            SizedBox(height: 10),
            // Add a text to the splash screen
            Text(
              'FitFusion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
