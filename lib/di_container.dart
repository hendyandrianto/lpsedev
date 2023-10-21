import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutterlpsetest/data/dio/dio_client.dart';
import 'package:flutterlpsetest/data/dio/logging_interceptor.dart';
import 'package:flutterlpsetest/data/model/login_view_model.dart';
import 'package:flutterlpsetest/data/repository/login_repo.dart';
import 'package:flutterlpsetest/data/repository/profile_repo.dart';
import 'package:flutterlpsetest/data/repository/splash_repo.dart';
import 'package:flutterlpsetest/helper/network_info.dart';
import 'package:flutterlpsetest/provider/login_provider.dart';
import 'package:flutterlpsetest/provider/splash_provider.dart';
import 'package:flutterlpsetest/utils/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.baseurl, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => LogInViewModel());

  // Repository
  sl.registerLazySingleton(
      () => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => LoginRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(
      () => ProfileRepo(dioClient: sl(), sharedPreferences: sl()));
  // Provider
  sl.registerFactory(
      () => SplashProvider(splashRepo: sl(), sharedPreferences: null));
  sl.registerFactory(() =>
      LoginProvider(authRepo: sl(), dioClient: sl(), sharedPreferences: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
