import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'app/main_app.dart';

void main() {
  const configuredApp = AppConfig(
    environment: Environment.dev,
    appTitle: '[DEV] Wallet Mobile',
    child: MyApp(),
  );

  runApp(configuredApp);
}
