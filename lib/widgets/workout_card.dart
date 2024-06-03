import 'package:flutter/material.dart';

// Utils
import 'package:activeaid/utils/utils.dart';

// Models
import 'package:activeaid/models/workout_plan.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({required this.workoutPlan, super.key});

  final WorkoutPlan workoutPlan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils().showDetails(context, workoutPlan),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/pushup.png",
                    height: 32,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 6),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${Utils().calculateTotalExercise(workoutPlan)} Exercises',
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '•',
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              Utils().calculateTotalDuration(
                                  workoutPlan.exercises,
                                  workoutPlan.rest,
                                  workoutPlan.repetitions),
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
