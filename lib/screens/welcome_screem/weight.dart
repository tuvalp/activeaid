import 'package:activeaid/utils/profile_utils.dart';
import 'package:activeaid/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  const Weight({required this.nextScreen, super.key});

  final void Function()? nextScreen;
  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> with SingleTickerProviderStateMixin {
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "What is your weight?",
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
            scrollController: FixedExtentScrollController(initialItem: weight),
            onSelectedItemChanged: (value) => (setState(() {
              weight = 30 + value;
            })),
            children: [
              for (var i = 40; i <= 200; i++)
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
              ProfileUtils().updateWeight(weight);
              widget.nextScreen!();
            },
            light: true,
          ),
        ),
      ],
    );
  }
}
