import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainAppBar {
  MainAppBar({required this.title});
  final String title;
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actionsIconTheme: const IconThemeData(color: Colors.black, size: 24),
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
      title: title != "Home"
          ? Text(title)
          : const Row(
              children: [
                Text('Active'),
                Text('Aid', style: TextStyle(color: Color(0XFF7C4DFF))),
              ],
            ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
          ),
        ),
      ],
    );
  }
}
