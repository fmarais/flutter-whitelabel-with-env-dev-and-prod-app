import 'package:base_project/main_prod.dart' as entry;
import 'package:config/config_dev.dart';

void main() {
  // set env
  var appHeadingCopy = APP_HEADING_COPY;

  entry.main(appHeadingCopy);
}