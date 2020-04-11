import 'package:auth/services/auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Auth>(Auth());
}
