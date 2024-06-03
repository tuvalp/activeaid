import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// Models
import '../models/workout_history.dart';

// Widgets
import '../widgets/progress_card.dart';

class ProgressList extends StatefulWidget {
  const ProgressList({super.key});

  @override
  State<ProgressList> createState() => _ProgressListState();
}

class _ProgressListState extends State<ProgressList> {
  final List<WorkoutHistory> workoutInProgress = [];

  final List<WorkoutHistory> workoutHistory =
      Hive.box<WorkoutHistory>('historyBox').values.map((e) => e).toList();

  @override
  void initState() {
    for (var element in workoutHistory) {
      if (element.isCompleted == false) {
        workoutInProgress.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        workoutInProgress.isEmpty
            ? Container()
            : const Text("Progress",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        workoutInProgress.isEmpty
            ? Container()
            : SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var progress in workoutInProgress)
                        ProgressCard(progress),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
