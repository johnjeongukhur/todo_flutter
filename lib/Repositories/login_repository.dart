// data/repositories/user_repository.dart

import 'package:get/get.dart';
import '../Model/login_model.dart';
import '../Services/login_service.dart';

class LoginRepository {
  final LoginService _loginService = Get.put(LoginService());

  Future<TodoLoginResponse> postLogin(String username, String password) async {
    try {
      final data = await _loginService.login(username, password);

      return data;
    } catch (e) {
      throw Exception('Failed to login_repositroy: $e');
    }
  }
}
