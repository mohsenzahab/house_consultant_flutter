import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/app/core/values/constants.dart';
import 'package:mobile/app/data/providers/prefs.dart';

class Api {
  final Dio _dio = _createDio();

  Api._internal();

  static final _singleton = Api._internal();

  static Api get api => _singleton;
  static Dio get dio => _singleton._dio;

  static Dio _createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Constants.url,
      receiveTimeout: 5000, // 15 seconds
      connectTimeout: 5000,
      sendTimeout: 5000,
    ));

    dio.interceptors.addAll({
      AppInterceptors(),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final String _tokenKey = 'token';

  String? token;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (await Prefs.hasToken) {
      token = await Prefs.token;
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {

  //   super.onError(err, handler);
  // }
}
