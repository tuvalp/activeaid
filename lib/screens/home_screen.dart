import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// Data
import '../data/workout_category.dart';
import '../data/workout_plan_data.dart';

// Models
import '../models/workout_category.dart';
import '../models/workout_history.dart';
import '../models/workout_plan.dart';

// Widgets
import '../widgets/category_button.dart';
import '../widgets/progress_list.dart';
import '../widgets/welcome_card.dart';
import '../widgets/workout_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeCategoryIndex = 0;

  List<WorkoutCategory> categories = WorkoutCategoryList.getCategories();

  List<WorkoutPlan> workoutPlans = WorkoutPlanData.getWorkoutPlans();
  List<WorkoutPlan> shottedWorkoutPlans = [];
  List<WorkoutHistory> workoutHistory =
      Hive.box<WorkoutHistory>('historyBox').values.map((e) => e).toList();

  @override
  void initState() {
    shottedWorkoutPlans = workoutPlans;

    super.initState();
  }

  void onCategorySelected(int index) {
    setState(() {
      activeCategoryIndex = index;

      if (activeCategoryIndex > 0) {
        shottedWorkoutPlans = workoutPlans
            .where((element) => element.category == activeCategoryIndex)
            .toList();
      } else {
        shottedWorkoutPlans = workoutPlans;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeCard(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: ProgressList(),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text("Categories",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 52,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var category in categories)
                    CategoryButton(
                      category: category,
                      onCategorySelected: onCategorySelected,
                      isActive: category == categories[activeCategoryIndex],
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              for (var plan in shottedWorkoutPlans)
                WorkoutCard(workoutPlan: plan),
            ],
          ),
        ],
      ),
    );
  }
}
