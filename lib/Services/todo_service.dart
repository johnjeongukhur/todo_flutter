import 'package:dio/dio.dart';
import 'package:first_flutter_project/API/api_client.dart';

import '../Model/todo_model.dart';

class TodoListService {
  final Dio _dio = ApiClient.getInstance();

  Future<List<TodoListResponse>> todoList() async {
    try {
      Response response = await _dio.get(
        '/todos/all',
      );

      List<dynamic> responseData = response.data as List<dynamic>;
      List<TodoListResponse> todos =
      responseData.map((json) => TodoListResponse.fromJson(json)).toList();

      return todos;
    }
    catch (error) {
      throw Exception('Failed to todo_service: $error');
    }
  }

}
