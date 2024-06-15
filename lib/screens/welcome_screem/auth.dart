import 'package:activeaid/utils/profile_utils.dart';
import 'package:activeaid/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({required this.nextScreen, super.key});

  final void Function()? nextScreen;
  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> with SingleTickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Create Account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Full Name",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text("Or",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 24)),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: "Continue with Google",
                light: true,
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: "Continue",
            light: true,
            onTap: () {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty) {
                ProfileUtils()
                    .updateAuth(nameController.text, emailController.text);
                widget.nextScreen!();
              }
            },
          ),
        )
      ],
    );
  }
}
