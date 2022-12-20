import 'package:flutter/material.dart';

import '../helpers/main_helper.dart';
import '../screens/home.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.themeData});

  final ThemeData themeData;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String titleApp = "";
    StatefulWidget homePage;

    if (isDev(context)) {
      titleApp = "Flutter Demo Home Page [DEV]";
      homePage = const MyHomePage(
          title: "Flutter Demo Home Page [DEV]",
          buttonText: "You have pushed the button this many times:",
          envText:
              "https://eqqai5cujc.execute-api.af-south-1.amazonaws.com/login-qa");
    } else {
      titleApp = "Flutter Demo Home Page";
      homePage = const MyHomePage(
          title: "Flutter Demo Home Page",
          buttonText: "You have pushed the button this many times:",
          envText:
              "https://eqqai5cujc.execute-api.af-south-1.amazonaws.com/login-prod");
    }

    return MaterialApp(
      title: titleApp,
      theme: themeData,
      home: homePage,
    );
  }
}
