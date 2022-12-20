import '../config/app_config.dart';

bool isDev(context) {
  return AppConfig.of(context).environment == Environment.dev;
}

Environment getEnv(context) {
  return AppConfig.of(context).environment;
}
