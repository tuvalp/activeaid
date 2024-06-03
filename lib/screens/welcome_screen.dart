import 'package:activeaid/screens/welcome_screem/age.dart';
import 'package:activeaid/screens/welcome_screem/auth.dart';
import 'package:activeaid/screens/welcome_screem/gender.dart';
import 'package:activeaid/screens/welcome_screem/heigt.dart';
import 'package:activeaid/screens/welcome_screem/welcome.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int screenIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void nextScreen() {
    setState(() {
      screenIndex++;
    });
    // Scroll to the next page
    _pageController.animateToPage(
      screenIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Opacity(
              opacity: screenIndex > 0 ? 1 : 0,
              child: const Text(
                "ActiveAid",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 500,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                allowImplicitScrolling: false,
                onPageChanged: (value) {
                  setState(() {
                    screenIndex = value;
                  });
                },
                children: [
                  Welcome(nextScreen: nextScreen),
                  Auth(nextScreen: nextScreen),
                  Gender(nextScreen: nextScreen),
                  Age(nextScreen: nextScreen),
                  Heigt(nextScreen: nextScreen),
                ],
              ),
            ),
            Opacity(
              opacity: screenIndex > 0 ? 1 : 0,
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 1; i < 5; i++)
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: i == screenIndex
                              ? Colors.white
                              : Theme.of(context).colorScheme.onSecondary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "ActiveAid",
//                 style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Let's get started",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Enter your email to continue",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Email",
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12))),
//                 onPressed: () {},
//                 child: const Text(
//                   "Continue",
//                   style: TextStyle(color: Colors.black),
//                 ),
//               )
//             ],
//           ),