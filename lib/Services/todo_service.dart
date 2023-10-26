import 'package:dio/dio.dart';
import 'package:first_flutter_project/API/api_client.dart';

import '../Model/todo_model.dart';

class TodoService {
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

  Future<TodoListResponse> postTodo({
    required String title,
    required String description,
    required int priority,
    required bool complete,
  }) async {
    try {
      Response response = await _dio.post(
        '/todos/create',
        queryParameters: {
          'title': title,
          'description': description,
          'priority': priority,
          'complete': complete,
        },
      );
      return TodoListResponse.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to create todo: $error');
    }
  }

  Future<TodoListResponse> putTodo({
    required int id,
    required String title,
    required String description,
    required int priority,
    required bool complete,
  }) async {
    try {
      Response response = await _dio.put(
        '/todos/update/$id',
        queryParameters: {
          'todo_id': id,
          'title': title,
          'description': description,
          'priority': priority,
          'complete': complete,
        },
      );
      return TodoListResponse.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to create todo: $error');
    }
  }

}
