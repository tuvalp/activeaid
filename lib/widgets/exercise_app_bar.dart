import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseAppBar {
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 38,
      iconTheme: const IconThemeData(color: Colors.black, size: 30),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
      title: const Text('Exercise'),
    );
  }
}
