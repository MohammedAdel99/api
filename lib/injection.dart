import 'my_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:api/web_services.dart';
import 'package:api/cubit/my_cubit.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

var token = '30ebc4000fcf012063dc04dc073cc47e7d99bcbd5f20179062f0ea8eaf979dca';
Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = 10*1000
    ..options.receiveTimeout = 10*1000
    ..options.headers["Authorization"] = "Bearer $token";

  dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true));
  return dio;
}
