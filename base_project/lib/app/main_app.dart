import 'package:flutter/material.dart';

import '../helpers/main_helper.dart';
import '../screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: homePage,
    );
  }
}
