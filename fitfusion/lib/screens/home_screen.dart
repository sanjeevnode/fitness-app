import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome to FitFusion!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add navigation to the profile screen
                setState(() {
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.remove('userId');
                  });
                });
              },
              child: const Text('set'),
            ),
          ],
        ),
      ),
    );
  }
}
