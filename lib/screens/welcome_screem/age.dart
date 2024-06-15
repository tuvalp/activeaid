import 'package:activeaid/utils/profile_utils.dart';
import 'package:activeaid/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  const Age({required this.nextScreen, super.key});

  final void Function()? nextScreen;
  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> with SingleTickerProviderStateMixin {
  int Age = 18;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "What is your age?",
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
            scrollController: FixedExtentScrollController(initialItem: Age),
            onSelectedItemChanged: (value) => (setState(() {
              Age = value;
            })),
            children: [
              for (var i = 0; i <= 100; i++)
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
              ProfileUtils().updateAge(Age);
              widget.nextScreen!();
            },
            light: true,
          ),
        ),
      ],
    );
  }
}
