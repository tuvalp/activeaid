import 'package:activeaid/models/exercise.dart';
import 'package:activeaid/models/workout_history.dart';
import 'package:activeaid/models/workout_plan.dart';
import 'package:activeaid/widgets/workout_detali.dart';
import 'package:flutter/material.dart';

class Utils {
  void showDetails(
    BuildContext context,
    WorkoutPlan workoutPlan, {
    WorkoutHistory? history,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      context: context,
      builder: (context) =>
          WorkoutDetali(workoutPlan: workoutPlan, history: history),
    );
  }

  String formattedDuration(int duration) {
    int display;
    String displayString;
    Duration d = Duration(seconds: duration);

    if (d > const Duration(seconds: 59)) {
      display = d.inMinutes;
      displayString = "Minutes";
    } else {
      display = d.inSeconds;
      displayString = "Seconds";
    }

    return '${display.toString()} $displayString';
  }

  double calculateCaloriesBurned(Exercise exercise) {
    // Assuming average weight and MET value of the exercise
    const double averageWeightKg = 70.0;
    double metValue = exercise.metValue;
    double caloriesPerMinute = metValue * 3.5 * averageWeightKg / 200;
    double totalMinutes = exercise.duration / 60.0;
    return caloriesPerMinute * totalMinutes;
  }

  String calculateTotalCaloriesBurned(List<Exercise> exercises) {
    double totalCaloriesBurned = exercises.fold(
        0.0,
        (previousValue, element) =>
            previousValue + calculateCaloriesBurned(element));
    return totalCaloriesBurned.toStringAsFixed(2);
  }

  String calculateTotalDuration(
      List<Exercise> exercises, int rest, int repetitions) {
    int totalExerciseDuration = exercises.fold(
            0, (previousValue, element) => previousValue + element.duration),
        totalDuration = ((totalExerciseDuration + rest) * repetitions).toInt();
    return formattedDuration(totalDuration);
  }

  String calculateTotalExercise(WorkoutPlan workoutPlan) {
    int totalExercises = workoutPlan.exercises.length * workoutPlan.repetitions;
    return totalExercises.toString();
  }

  String calculateExerciseRemaining(
      WorkoutPlan workoutPlan, WorkoutHistory workoutHistory) {
    int remainingExercises;

    remainingExercises =
        workoutPlan.exercises.length - workoutHistory.exercises.length;

    return remainingExercises.toString();
  }

  String timeRemaining(WorkoutHistory workoutHistory) {
    int planTime = (workoutHistory.plan.exercises.fold(0,
                (previousValue, element) => previousValue + element.duration) *
            3)
        .toInt();

    int repetitionsLeft =
        (workoutHistory.plan.repetitions - 1) - workoutHistory.repetitions;
    int rastTime = workoutHistory.plan.rest * repetitionsLeft;
    int historyTime = workoutHistory.exercises
        .fold(0, (previousValue, element) => previousValue + element.duration)
        .toInt();

    int remainingTime = (planTime - historyTime) + rastTime;

    return formattedDuration(remainingTime);
  }

  List<ExerciseDurationPerDate> totalExerciseDurationPerDate(
      List<WorkoutHistory> workoutHistory, int numberOfDays) {
    List<ExerciseDurationPerDate> resultList = [];

    // Calculate the start date based on the given number of days
    DateTime startDate =
        DateTime.now().subtract(Duration(days: numberOfDays - 1));

    // Iterate over each day within the specified range
    for (int i = 0; i < numberOfDays; i++) {
      DateTime currentDate = startDate.add(Duration(days: i));

      // Filter workout history for the current date
      List<WorkoutHistory> workoutHistoryForDate = workoutHistory
          .where((history) =>
              history.date.day == currentDate.day &&
              history.date.month == currentDate.month &&
              history.date.year == currentDate.year)
          .toList();

      // Calculate total duration for the current date
      Duration totalDuration = Duration.zero;
      for (var history in workoutHistoryForDate) {
        totalDuration += Duration(
            seconds: history.exercises.fold(0,
                (previousValue, element) => previousValue + element.duration));
      }

      // Add an ExerciseDurationPerDate object for the current date to the resultList
      resultList.add(ExerciseDurationPerDate(currentDate, totalDuration));
    }

    resultList.forEach((element) {
      print('${element.date} :  ${element.totalDuration}');
    });

    return resultList;
  }
}

class ExerciseDurationPerDate {
  final DateTime date;
  late Duration totalDuration;

  ExerciseDurationPerDate(this.date, this.totalDuration);
}
