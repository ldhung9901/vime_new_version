import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_vime/core/constants/constants.dart';
import 'package:new_vime/core/networks/network_info.dart';
import 'package:new_vime/core/utils/date_converter.dart';
import 'package:new_vime/feature/home/presentation/bloc/providers/directionality_provider.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/directionality_cubit/directionality_cubit.dart';
import 'package:new_vime/feature/home/presentation/bloc/shared_cubit/theme_cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  /// Provider
  /// /// Directionality Provider
  locator.registerFactory(
    () => DirectionalityProvider(),
  );

  /// Cubit
  /// /// Theme Cubit
  locator.registerFactory(
    () => ThemeCubit(),
  );

  /// /// Directionality Cubit
  locator.registerFactory(
    () => DirectionalityCubit(),
  );

  /// /// BottomNavigationBar Cubit
  locator.registerFactory(
    () => BottomNavigationBarCubit(),
  );

  /// Bloc
  /// /// User Bloc

  /// UseCase
  /// /// User UseCase

  /// Repositories
  /// /// User Repository
  // locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
  //     userLocalDataSource: locator(),
  //     userRemoteDataSource: locator(),
  //     networkInfo: locator(),
  //   ),
  // );
  /// DataSources
  /// /// User DataSource

  ///! Core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton(() => Constants());
  locator.registerLazySingleton(() => DateConverter());

  ///! External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker.createInstance());

  /// Rest Client
  locator.registerLazySingleton<Dio>(() => Dio());
}
