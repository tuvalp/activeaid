import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Data
import '../data/workout_plan_data.dart';

// Models
import '../models/workout_history.dart';
import '../models/workout_plan.dart';

// Utils
import '../utils/utils.dart';

// Widgets
import '../widgets/primary_button.dart';

class WelcomeCard extends StatefulWidget {
  const WelcomeCard({super.key});

  @override
  State<WelcomeCard> createState() => _WelcomeCardState();
}

class _WelcomeCardState extends State<WelcomeCard> {
  List<WorkoutPlan> workoutPlans = WorkoutPlanData.getWorkoutPlans();
  List<WorkoutHistory> workoutHistory = [];

  @override
  void initState() {
    super.initState();
    workoutHistory =
        Hive.box<WorkoutHistory>('historyBox').values.map((e) => e).toList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0XFF9747FF),
            Color(0XFF6F00FF),
          ],
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  workoutHistory.isNotEmpty &&
                          workoutHistory
                              .where((element) => element.isCompleted == true)
                              .isNotEmpty
                      ? "Do it again: ${workoutHistory.where((element) => element.isCompleted == true).toList().last.plan.name}"
                      : "Lets start: ${workoutPlans[1].name}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PrimaryButton(
                    text: "Start workout",
                    onTap: () {
                      if (workoutHistory.isNotEmpty &&
                          workoutHistory
                              .where((element) => element.isCompleted == true)
                              .isNotEmpty) {
                        Utils().showDetails(
                            context,
                            workoutHistory
                                .where((element) => element.isCompleted == true)
                                .toList()
                                .last
                                .plan);
                      } else {
                        Utils().showDetails(context, workoutPlans[0]);
                      }
                    },
                    light: true),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/pushup.png",
              ),
            ),
          )
        ],
      ),
    );
  }
}
