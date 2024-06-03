import 'package:activeaid/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:activeaid/models/exercise.dart';
import 'package:activeaid/models/workout_history.dart';
import 'package:activeaid/models/workout_plan.dart';
import 'package:activeaid/theme.dart';

import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutHistoryAdapter());
  Hive.registerAdapter(WorkoutPlanAdapter());
  Hive.registerAdapter(ExerciseAdapter());

  await Hive.openBox<WorkoutHistory>('historyBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ActiveAid',
      home: const WelcomeScreen(),
      //const Main(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: lightTheme,
    );
  }
}
