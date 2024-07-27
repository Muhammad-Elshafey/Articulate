import 'package:articulate/core/utils/api_services.dart';
import 'package:articulate/features/home/data/repos/home_repo_implementation.dart';
import 'package:articulate/features/new_password/data/repos/reset_password_repo_implementation.dart';
import 'package:articulate/features/profile/data/repos/user_repo_implementation.dart';
import 'package:articulate/features/test_feature/data/repos/test_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo_implementation.dart';
import '../data_base/cache_helper.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
  getIt.registerSingleton<AuthRepoImplementation>(
      AuthRepoImplementation(apiServices: getIt.get<ApiServices>()));
  getIt.registerSingleton<ResetPasswordRepoImplementation>(
      ResetPasswordRepoImplementation(apiServices: getIt.get<ApiServices>()));
  getIt.registerSingleton<UserRepoImplementation>(
      UserRepoImplementation(apiServices: getIt.get<ApiServices>()));
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(apiServices: getIt.get<ApiServices>()));
  getIt.registerSingleton<TestRepoImplementation>(
      TestRepoImplementation(apiServices: getIt.get<ApiServices>()));
}
