// di mean Dependency injection

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_app/app/app_prefs.dart';
import 'package:tut_app/data/data_source/remote_data_source.dart';
import 'package:tut_app/data/network/app_api.dart';
import 'package:tut_app/data/network/network_info.dart';
import 'package:tut_app/data/repo/repo_impl.dart';
import 'package:tut_app/domain/repository/repo.dart';
import 'package:tut_app/domain/usecase/login_usecase.dart';
import 'package:tut_app/presentation/features/login_view/viewmodel/login_viewmodel.dart';

import '../data/network/dio_factory.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module, it's a module where we put all generic DI

  // 1. instance from SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // 2. instance from appPrefs file
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // 3. instance from network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // 4. instance from dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //5. instance from app service clients
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //6. instance from remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  //7. instance from repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  //  LoginModuleلانو يلي بدي استخمو خاص فقط بال  registerLazySingleton هون انا ما لازم استخدم
  // وبس خلص من هاد القسم يموت وما يضل شغال على مستوى التطبيق بشكل كاامل
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
