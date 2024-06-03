import 'package:hive/hive.dart';

import 'package:activeaid/models/exercise.dart';
import 'package:activeaid/models/workout_plan.dart';

part 'workout_history.g.dart';

@HiveType(typeId: 1)
class WorkoutHistory {
  WorkoutHistory({
    required this.date,
    required this.isCompleted,
    required this.plan,
    required this.repetitions,
    required this.exesrciseIndex,
    required this.exercises,
  });

  @HiveField(0)
  DateTime date;

  @HiveField(1)
  bool isCompleted;

  @HiveField(2)
  WorkoutPlan plan;

  @HiveField(3)
  int repetitions;

  @HiveField(4)
  int exesrciseIndex;

  @HiveField(5)
  List<Exercise> exercises;
}
