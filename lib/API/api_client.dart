import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'keychain.dart';

class ApiClient {
  static final Dio _dio = Dio(_getOptions());
  final _storage = const FlutterSecureStorage();

  static BaseOptions _getOptions() {
    return BaseOptions(
      baseUrl: 'http://127.0.0.1:8000', // API의 기본 URL
      connectTimeout: Duration(seconds: 5), // 연결 대기 시간 (5초)
      receiveTimeout: Duration(seconds: 3), // 응답 대기 시간 (3초)
    );
  }

  static Dio getInstance() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 모든 API 요청에 대한 인터셉터 설정
          // 예를 들어, 헤더 추가, 토큰 체크 등의 공통 작업을 수행할 수 있습니다.
          // options.headers["Authorization"] = "Bearer YOUR_ACCESS_TOKEN";
          String? token = await TokenStorage().readToken();

          options.headers["Authorization"] = "Bearer $token";
          options.headers["accept"] = "application/json";
          options.headers["Content-Type"] = "application/x-www-form-urlencoded";

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 응답에 대한 공통 작업을 수행할 수 있습니다.
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // 에러 응답에 대한 공통 작업을 수행할 수 있습니다.
          return handler.next(e);
        },
      ),
    );
    return _dio;
  }

}
