import 'package:activeaid/models/exercise.dart';
import 'package:activeaid/models/workout_history.dart';
import 'package:activeaid/utils/utils.dart';

import 'package:activeaid/widgets/progress_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class ActivtyScreen extends StatefulWidget {
  const ActivtyScreen({super.key});

  @override
  State<ActivtyScreen> createState() => _ActivtyScreenState();
}

class _ActivtyScreenState extends State<ActivtyScreen> {
  Duration duration = const Duration(days: 7);
  late String totalCaloriesBurned;
  late String totalExercise;
  late List<ExerciseDurationPerDate> _totalExerciseDurationPerDate;
  late int _maxY = 0;

  final List<WorkoutHistory> history =
      Hive.box<WorkoutHistory>('historyBox').values.toList();

  void getStatistics() {
    // Get the statistics
    List<WorkoutHistory> workoutByDate = Hive.box<WorkoutHistory>('historyBox')
        .values
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(duration)))
        .toList();

    List<Exercise> exercises = [];

    for (var element in workoutByDate) {
      exercises.addAll(element.exercises);
    }

    totalExercise = exercises.length.toString();
    totalCaloriesBurned =
        Utils().calculateTotalCaloriesBurned(exercises).split('.')[0];

    _totalExerciseDurationPerDate =
        Utils().totalExerciseDurationPerDate(workoutByDate, duration.inDays);

    for (var duration in _totalExerciseDurationPerDate) {
      if (duration.totalDuration.inMinutes > _maxY) {
        _maxY = duration.totalDuration.inMinutes;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Statstics',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: Duration(days: 7),
                        child: Text('Last 7 days'),
                      ),
                      DropdownMenuItem(
                        value: Duration(days: 30),
                        child: Text('Last 30 days'),
                      ),
                      DropdownMenuItem(
                        value: Duration(days: 365),
                        child: Text('Last year'),
                      )
                    ],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF7C4DFF),
                    ),
                    iconEnabledColor: const Color(0XFF7C4DFF),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 26,
                    ),
                    underline: Container(),
                    isDense: true,
                    value: duration,
                    onChanged: (value) {
                      setState(() {
                        duration = value as Duration;
                      });
                      getStatistics();
                    })
              ],
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 240,
              child: LineChart(
                LineChartData(
                    baselineY: 10,
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 52,
                          interval: 1,
                          getTitlesWidget: (value, meta) => Text(
                            '${value.toString().split(".")[0]} min',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF9C9BC2),
                            ),
                          ),
                        ),
                      ),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: duration.inDays > 30
                              ? 62
                              : duration.inDays > 7
                                  ? 5
                                  : 1,
                          getTitlesWidget: (value, meta) => Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF9C9BC2),
                              ),
                              duration.inDays > 30
                                  ? DateFormat('MMM').format(
                                      _totalExerciseDurationPerDate[
                                              value.toInt()]
                                          .date)
                                  : duration.inDays > 7
                                      ? DateFormat('dd').format(
                                          _totalExerciseDurationPerDate[
                                                  value.toInt()]
                                              .date)
                                      : DateFormat('EE').format(
                                          _totalExerciseDurationPerDate[
                                                  value.toInt()]
                                              .date),
                            ),
                          ),
                        ),
                      ),
                    ),
                    minX: 0,
                    minY: 0,
                    maxX: duration.inDays.toDouble() - 1,
                    maxY: (_maxY.toDouble() * 1.5).toDouble(),
                    lineBarsData: [
                      LineChartBarData(
                        preventCurveOverShooting: true,
                        barWidth: 5,
                        isCurved: true,
                        color: const Color(0XFF7C4DFF),
                        dotData: const FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          color: const Color(0XFF7C4DFF).withOpacity(0.3),
                        ),
                        spots: [
                          for (var element
                              in _totalExerciseDurationPerDate) ...{
                            FlSpot(
                              _totalExerciseDurationPerDate
                                  .indexOf(element)
                                  .toDouble(),
                              element.totalDuration.inMinutes.toDouble(),
                            )
                          }
                        ],
                      ),
                    ]),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  width: 160,
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Color(0XFFF3F6FB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.fitness_center,
                          size: 36,
                          color: Color(0XFF7C4DFF),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              totalExercise,
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Exercises',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0XFF9C9BC2)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: 160,
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Color(0XFFF3F6FB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.bolt,
                          size: 36,
                          color: Color(0XFF7C4DFF),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              totalCaloriesBurned,
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Calories Burned',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0XFF9C9BC2)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ProgressList(),
          ],
        ),
      ),
    );
  }
}
