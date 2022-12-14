import 'package:dio/dio.dart';
import 'package:resfli/index.dart';

class ApiService {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: StringConsts.baseUrl));

  ApiService._internal();

  static final _singleton = ApiService._internal();

  factory ApiService() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: StringConsts.baseUrl,
        receiveTimeout: 15000,
        connectTimeout: 15000,
        sendTimeout: 15000,
      ),
    );

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters.addAll({});
    return handler.next(options);
  }
}
