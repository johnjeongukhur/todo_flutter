import 'package:dio/dio.dart';
import 'package:first_flutter_project/API/api_client.dart';

import '../Model/todo_model.dart';

class TodoDetailService {
  final Dio _dio = ApiClient.getInstance();

  Future<TodoListResponse> getTodoDetail(int todoId) async {
    try {
      Response response = await _dio.get(
        '/todos/detail/$todoId',
      );

      return TodoListResponse.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to get todo detail: $error');
    }
  }
}
