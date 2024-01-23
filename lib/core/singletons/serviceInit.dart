
import 'package:ecommerce_app_with_tdd/core/singletons/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton(DioSettings.new);

}