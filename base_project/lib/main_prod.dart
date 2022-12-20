import 'package:flutter/material.dart';

import 'app/main_app.dart';
import 'config/app_config.dart';

// entry point for prod base_app startup
void main() {
  _mainCore(ThemeData(primarySwatch: Colors.blue));
}

// entry point for prod flavour app startup
void mainFlavourApp({required ThemeData themeData}) {
  _mainCore(themeData);
}

void _mainCore(ThemeData themeData) {
  var configuredApp = AppConfig(
    environment: Environment.prod,
    appTitle: 'Base Project',
    child: MyApp(themeData: themeData),
  );

  runApp(configuredApp);
}
