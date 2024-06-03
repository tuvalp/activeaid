import 'package:activeaid/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({required this.nextScreen, super.key});

  final void Function()? nextScreen;
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> with SingleTickerProviderStateMixin {
  String gender = "Male";
  bool isExit = false;

  void setGender(String gender) {
    setState(() {
      this.gender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "What's your gender?",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () => setGender("Male"),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSecondary,
                              width: 2,
                            ),
                          ),
                          child: gender == "Male"
                              ? Center(
                                  child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
                                )
                              : Container(),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                      ],
                    ),
                    Icon(Icons.male,
                        size: 32,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => setGender("Female"),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSecondary,
                              width: 2,
                            ),
                          ),
                          child: gender == "Female"
                              ? Center(
                                  child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
                                )
                              : Container(),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "Female",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                      ],
                    ),
                    Icon(Icons.female,
                        size: 32,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => setGender("Other"),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSecondary,
                              width: 2,
                            ),
                          ),
                          child: gender == "Other"
                              ? Center(
                                  child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
                                )
                              : Container(),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "Other",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                      ],
                    ),
                    Icon(Icons.transgender,
                        size: 32,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: "Continue",
            onTap: () {
              widget.nextScreen!();
            },
            light: true,
          ),
        ),
      ],
    );
  }
}
