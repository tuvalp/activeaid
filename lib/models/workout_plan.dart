import 'package:hive/hive.dart';

import 'package:activeaid/models/exercise.dart';

part 'workout_plan.g.dart';

@HiveType(typeId: 2)
class WorkoutPlan {
  @HiveField(0)
  String name;

  @HiveField(1)
  int category;

  @HiveField(2)
  List<Exercise> exercises;

  @HiveField(3)
  int rest;

  @HiveField(4)
  int repetitions;

  WorkoutPlan({
    required this.name,
    required this.category,
    required this.exercises,
    required this.rest,
    required this.repetitions,
  });
}
