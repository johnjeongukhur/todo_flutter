

import 'dart:ffi';

import 'package:first_flutter_project/Model/todo_model.dart';
import 'package:first_flutter_project/Repositories/tododetail_repository.dart';
import 'package:get/get.dart';

class TodoDetailViewModel extends GetxController {
  var isLoading = false.obs;
  var todo = Rx<TodoListResponse?>(null);

  final TodoDetailRepository _todoDetailRepository = Get.put(TodoDetailRepository());

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getDetailTodo(37);
  // }

  void getDetailTodo(int id) async {
    try {
      isLoading(true);
      var data = await _todoDetailRepository.getTodoDetail(id);
      todo.value = data;
      print('데이터ㅓㅓㅓ ${data.description}');
    } catch (error) {
      print('Failed to fetch todo detail: $error');
    } finally {
      isLoading(false);
    }
  }


}