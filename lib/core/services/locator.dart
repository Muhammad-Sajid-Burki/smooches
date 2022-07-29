
import 'package:get_it/get_it.dart';
import 'package:smooches/core/services/auth_services.dart';
import 'package:smooches/core/services/database_services.dart';


GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(AuthService());
  locator.registerSingleton(DatabaseService());
//  locator.registerSingleton(NotificationsStatusProvider());
}
