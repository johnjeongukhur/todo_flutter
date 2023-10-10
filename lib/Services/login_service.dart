import 'package:dio/dio.dart';
import 'package:first_flutter_project/API/api_client.dart';

import '../Model/login_model.dart';

class LoginService {
  final Dio _dio = ApiClient.getInstance();

  Future<TodoLoginResponse> login(String username, String password) async {
    try {
      var loginData = {
        'username': username,
        'password': password,
      };

      Response response = await _dio.post(
        '/auth/login',
        data: FormData.fromMap(loginData),
      );

      print('Response Status Code: ${response.statusCode}');
      return TodoLoginResponse.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to login_service: $error');
    }
  }
}
