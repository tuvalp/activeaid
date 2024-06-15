import 'package:activeaid/utils/profile_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:activeaid/theme.dart';

// Models
import 'package:activeaid/models/profile.dart';
import 'package:activeaid/models/exercise.dart';
import 'package:activeaid/models/workout_history.dart';
import 'package:activeaid/models/workout_plan.dart';

// Screens
import 'screens/main_screen.dart';
import 'package:activeaid/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutHistoryAdapter());
  Hive.registerAdapter(WorkoutPlanAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(ProfileAdapter());

  await Hive.openBox<WorkoutHistory>('historyBox');
  await Hive.openBox<Profile>('profileBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final profile = Hive.box<Profile>("profileBox");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ActiveAid',
      home: ProfileUtils().profileBox.isEmpty
          ? const WelcomeScreen()
          : const Main(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: lightTheme,
    );
  }
}
