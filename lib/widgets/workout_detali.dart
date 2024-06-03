import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// Models
import 'package:activeaid/models/workout_history.dart';
import 'package:activeaid/models/workout_plan.dart';

// Utils
import 'package:activeaid/utils/utils.dart';

// Screens
import 'package:activeaid/screens/workout_player.dart';

// Widgets
import 'package:activeaid/widgets/primary_button.dart';

class WorkoutDetali extends StatelessWidget {
  const WorkoutDetali({required this.workoutPlan, this.history, super.key});

  final WorkoutPlan workoutPlan;
  final WorkoutHistory? history;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                history != null
                    ? SizedBox(
                        width: 60,
                        height: 65,
                        child: CircularPercentIndicator(
                          radius: 32.0,
                          lineWidth: 6.0,
                          percent: history!.exercises.length /
                              double.parse(
                                  Utils().calculateTotalExercise(workoutPlan)),
                          center: Text(
                            "${history!.exercises.length} / ${Utils().calculateTotalExercise(workoutPlan)}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          progressColor: Theme.of(context).colorScheme.primary,
                          backgroundColor: const Color(0XFFE1E6EE),
                        ),
                      )
                    : Image.asset(
                        "assets/pushup.png",
                        height: 38,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workoutPlan.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          history != null
                              ? '${(int.parse(Utils().calculateTotalExercise(workoutPlan)) - history!.exercises.length).toString()} Exercises left'
                              : '${Utils().calculateTotalExercise(workoutPlan)} Exercises',
                          style: const TextStyle(
                            color: Color(0XFF9C9BC2),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '•',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          history != null
                              ? '${Utils().timeRemaining(history!)} left'
                              : Utils().calculateTotalDuration(
                                  workoutPlan.exercises,
                                  workoutPlan.rest,
                                  workoutPlan.repetitions),
                          style: const TextStyle(
                            color: Color(0XFF9C9BC2),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Exercises",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 160,
              child: ListView(
                children: [
                  for (var exercise in workoutPlan.exercises)
                    Text(
                      '•  ${exercise.name}',
                      style: const TextStyle(
                          fontSize: 15, color: Color(0XFF81809E)),
                    ),
                ],
              ),
            ),
            PrimaryButton(
                text: history != null ? "Continue Exercise" : "Start Exercise",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutPlayer(
                        plan: workoutPlan,
                        history: history,
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
