import 'package:get_it/get_it.dart';
import 'package:news_app/logic/thl.dart';

GetIt locator = GetIt.instance;

serviceLocator()
{
  locator.registerLazySingleton(() => TopHeadLinesBLoC());
}