import 'package:get_it/get_it.dart';
import 'package:test_cpssoft/model/mUser.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register LoginService as Singleton
  locator.registerSingleton(User());

  // Register UserProfile as Factory
  // locator.registerFactory(() => User());
}
