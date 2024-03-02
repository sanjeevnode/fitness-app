import 'dart:async';

import 'package:fitfusion/constant.dart';
import 'package:fitfusion/provider/providers.dart';
import 'package:fitfusion/screens/home/home.dart';
import 'package:fitfusion/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? _userId;

  @override
  void initState() {
    super.initState();
    debugPrint('SplashScreen: initState');
    _checkUser();
    debugPrint('done checking user ');

    Timer(const Duration(seconds: 2), () {
      debugPrint('timer');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              _userId == null ? const WelcomScreen() : const Home(),
        ),
      );
    });
  }

  Future<void> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      debugPrint('in checkuser user');
      print(prefs.getString('user'));
      _userId = prefs.getString('user');
      Provider.of<GlobalProvider>(context, listen: false)
          .setUserid(_userId == null ? "" : _userId!);
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
