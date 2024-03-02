import 'package:fitfusion/constant.dart';
import 'package:fitfusion/screens/onboarding/onboadring_screen.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: bgColor,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/img-0.jpg'),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 250,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color.fromARGB(255, 18, 17, 17),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 120),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Welcome to\n',
                                    style: TextStyle(
                                      color: textColors,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'FitFusion',
                                    style: TextStyle(
                                      color: popColors,
                                      fontSize: 55,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // child: Text(
                            //   'Welcome to',
                            //   style: TextStyle(
                            //     color: textColors,
                            //     fontSize: 30,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),

                            // Text(
                            //   'FitFusion',
                            //   style: TextStyle(
                            //     color: textColors,
                            //     fontSize: 55,
                            //     fontWeight: FontWeight.w800,
                            //   ),
                            // ),

                            // Text(
                            //   'Welcome to your journey towards better health and fitness!',
                            //   style: TextStyle(
                            //     color: textColors2,
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Welcome to your journey towards better health and fitness!',
                      style: TextStyle(
                        color: textColors2,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnboadingScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: popColors,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
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
            ],
          ),
        ),
      ),
    );
  }
}
