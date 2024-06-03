import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// Models
import 'package:activeaid/models/workout_history.dart';

// Utils
import 'package:activeaid/utils/utils.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard(this._workoutHistory, {super.key});
  final WorkoutHistory _workoutHistory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils().showDetails(context, _workoutHistory.plan,
            history: _workoutHistory);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 18),
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 65,
                child: CircularPercentIndicator(
                  radius: 32.0,
                  lineWidth: 6.0,
                  percent: _workoutHistory.exercises.length /
                      double.parse(
                          Utils().calculateTotalExercise(_workoutHistory.plan)),
                  center: Text(
                    "${_workoutHistory.exercises.length} / ${Utils().calculateTotalExercise(_workoutHistory.plan)}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  progressColor: Theme.of(context).colorScheme.primary,
                  backgroundColor: const Color(0XFFE1E6EE),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 15,
                child: Text(
                  _workoutHistory.plan.name,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "${Utils().timeRemaining(_workoutHistory)} left",
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
