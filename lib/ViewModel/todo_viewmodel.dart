import 'package:get/get.dart';

import '../Model/todo_model.dart';
import '../Repositories/todo_repository.dart';

class TodoViewModel extends GetxController {
  var isLoading = false.obs;
  var todoList = <TodoListResponse>[].obs;

  final TodoRepository _todoRepository = Get.put(TodoRepository());

  @override
  void onInit() {
    super.onInit();
    getAllTodo();
  }

  void getAllTodo() async {
    try {
      isLoading(true);
      var data = await _todoRepository.getTodoList();
      todoList.assignAll(data);
      print('투두리스트 --- ${data}, 길이 ${data.length}');
    } catch (error) {
      print('Error: $error');
      // Handle the error, show a snackbar, or perform other actions.
    } finally {
      isLoading(false);
    }
  }

  void putIsCompleteTodo(int id, String title, String description, int priority, bool isComplete) async {
    try {
      isLoading(true);
      var data = await _todoRepository.putTodo(id, title, description, priority, isComplete);
      print('Todo Done!!!');
    } catch (error) {
      print('Error $error');
    } finally {
      getAllTodo();
      isLoading(false);
    }
  }

  void deleteTodo(int id) async {
    try {
      isLoading(true);
      var data = await _todoRepository.deleteTodo(id);
      print('Todo Deleted!!!');
    } catch (error) {
      print('Error $error');
    } finally {
      getAllTodo();
      isLoading(false);
    }
  }

}
