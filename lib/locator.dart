import 'core/services/Api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
    locator.registerLazySingleton(() => Api('books'));
}