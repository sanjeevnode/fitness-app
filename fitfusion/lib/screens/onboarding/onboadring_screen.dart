import 'package:fitfusion/constant.dart';
import 'package:fitfusion/screens/home/set_profile.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: bgColor,
          child: PageView(
            controller: _pageController,
            children: [
              Page(
                pageController: _pageController,
                text1: 'Activity\n',
                text2: 'Tracking',
                subHeading:
                    'Track your progress, set goals, and stay motivated with our comprehensive activity tracking feature.',
                image: 'assets/img-1.jpg',
              ),
              Page(
                  pageController: _pageController,
                  text1: 'Alarm\n',
                  text2: 'Reminder',
                  subHeading:
                      'Never miss a workout with our alarm tracking feature, ensuring you stay on schedule and committed to your fitness goals.',
                  image: 'assets/img-2.jpg'),
              Page(
                  pageController: _pageController,
                  text1: 'Diet plan\n',
                  text2: 'Tracking',
                  subHeading:
                      'Stay on top of your nutrition goals with personalized diet plans tailored to your needs and preferences.',
                  image: 'assets/img-3.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String text1;
  final String text2;
  final String subHeading;
  final String image;

  const Page({
    super.key,
    required PageController pageController,
    required this.text1,
    required this.text2,
    required this.subHeading,
    required this.image,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(image),
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
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: text1,
                              style: const TextStyle(
                                color: textColors,
                                fontSize: 55,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: text2,
                              style: const TextStyle(
                                color: textColors,
                                fontSize: 50,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //const SizedBox(height: 20),
                      // const Text(
                      //   'The best place to find your fitness',
                      //   style: TextStyle(
                      //     color: textColors2,
                      //     fontSize: 20,
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
              const SizedBox(height: 10),
              Text(
                subHeading,
                style: const TextStyle(
                  color: textColors3,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: popColors,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_pageController.page!.round() == 3 - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SetProfile()),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
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
                  'Next',
                  style: TextStyle(
                    color: textColors,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
