import 'package:first_flutter_project/Model/login_model.dart';
import 'package:first_flutter_project/Repositories/login_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../API/api_client.dart';
import '../API/keychain.dart';
import '../View/todo_view.dart';

class LoginViewModel extends GetxController {
  var isLoading = false.obs;

  var username = ''.obs;
  var password = ''.obs;

  final storage = TokenStorage();
  final LoginRepository _loginRepository = Get.put(LoginRepository());

  void login() async {
    try {
      isLoading(true);
      TodoLoginResponse response =
          await _loginRepository.postLogin(username.value, password.value);

      if (response.code == 200) {
        await storage.saveToken(response.accessToken);
        Get.snackbar('Success', 'Logged in successfully');
        // Get.toNamed('/todo');
        Get.offAll(() => TodoView()); // 스택 비우고 TodoView로 이동
      } else {
        throw Exception('Failed to log in');
      }

      isLoading(false);
    } catch (error) {
      print('Error: $error');
      isLoading(false);
      Get.snackbar('Error', 'Failed to log in');
    }
  }

}

