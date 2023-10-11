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
}
