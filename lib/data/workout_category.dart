import 'package:activeaid/models/workout_category.dart';

class WorkoutCategoryList {
  static List<WorkoutCategory> getCategories() {
    return [
      WorkoutCategory(
        name: "All",
        id: 0,
      ),
      WorkoutCategory(
        name: "Full Body",
        id: 1,
      ),
      WorkoutCategory(
        name: "Lower Body",
        id: 2,
      ),
      WorkoutCategory(
        name: "Upper Body",
        id: 3,
      ),
      WorkoutCategory(
        name: "Core Workouts",
        id: 4,
      ),
      WorkoutCategory(
        name: "Cardio Workouts",
        id: 5,
      ),
      WorkoutCategory(
        name: "Strength and Stability",
        id: 6,
      ),
    ];
  }
}
