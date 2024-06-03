import 'package:flutter/material.dart';

// Utils
import 'package:activeaid/utils/utils.dart';

// Models
import 'package:activeaid/models/workout_history.dart';

// Widgets
import 'package:activeaid/widgets/primary_button.dart';

class WorkoutCompelted extends StatelessWidget {
  const WorkoutCompelted({required this.workoutHistory, super.key});
  final WorkoutHistory workoutHistory;

  @override
  Widget build(BuildContext context) {
    int totalDuration = workoutHistory.exercises
        .fold(0, (previousValue, element) => previousValue + element.duration);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle_outline_sharp,
          color: Theme.of(context).colorScheme.primary,
          size: 120,
        ),
        const Text(
          "Workout Completed",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0XFFF3F6FB),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      Text(
                        Duration(seconds: totalDuration)
                            .toString()
                            .substring(2, 7),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Minutes",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.secondary),
                      )
                    ]),
                    const Divider(),
                    Column(children: [
                      Text(
                        Utils().calculateTotalCaloriesBurned(
                            workoutHistory.exercises),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Calories",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSecondary),
                      )
                    ]),
                  ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child:
              PrimaryButton(text: "Done", onTap: () => Navigator.pop(context)),
        ),
      ],
    );
  }
}
