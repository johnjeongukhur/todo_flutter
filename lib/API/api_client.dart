import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'keychain.dart';

class ApiClient {
  static final Dio _dio = Dio(_getOptions());
  final _storage = const FlutterSecureStorage();

  static BaseOptions _getOptions() {
    return BaseOptions(
      baseUrl: 'http://127.0.0.1:8000', // iOS
      // baseUrl: 'http://10.0.2.2:8000', // Android
      connectTimeout: Duration(seconds: 5), // 연결 대기 시간
      receiveTimeout: Duration(seconds: 3), // 응답 대기 시간
    );
  }

  static Dio getInstance() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await TokenStorage().readToken();

          options.headers["Authorization"] = "Bearer $token";
          options.headers["accept"] = "application/json";
          options.headers["Content-Type"] = "application/x-www-form-urlencoded";

          return handler.next(options);
        },
        onResponse: (response, handler) {
          //TODO: - 응답에 대한 공통 작업
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          //TODO: - 에러 응답에 대한 공통 작업
          return handler.next(e);
        },
      ),
    );
    return _dio;
  }

}
