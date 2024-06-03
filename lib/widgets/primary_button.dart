import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {required this.text, required this.onTap, this.light, super.key});

  final String text;
  final void Function() onTap;
  final bool? light;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: light == true
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: light == true
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
