import 'package:activeaid/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({required this.nextScreen, super.key});

  final void Function()? nextScreen;
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Text(
              "ActiveAid",
              style: TextStyle(
                  fontSize: 58,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: "Get Started",
            light: true,
            onTap: () {
              widget.nextScreen!();
            },
          ),
        ),
      ],
    );
  }
}
