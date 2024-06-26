import 'package:activeaid/utils/profile_utils.dart';
import 'package:activeaid/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Heigt extends StatefulWidget {
  const Heigt({required this.nextScreen, super.key});

  final void Function()? nextScreen;
  @override
  State<Heigt> createState() => _HeigtState();
}

class _HeigtState extends State<Heigt> with SingleTickerProviderStateMixin {
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "What is your height?",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        SizedBox(
          height: 180,
          child: CupertinoPicker(
            itemExtent: 40,
            backgroundColor: Theme.of(context).colorScheme.primary,
            scrollController: FixedExtentScrollController(initialItem: height),
            onSelectedItemChanged: (value) => (setState(() {
              height = 120 + value;
            })),
            children: [
              for (var i = 120; i <= 220; i++)
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    i.toString(),
                    style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: "Continue",
            onTap: () {
              ProfileUtils().updateHeight(height);
              widget.nextScreen!();
            },
            light: true,
          ),
        ),
      ],
    );
  }
}
