import 'package:first_flutter_project/ViewModel/todo_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../API/keychain.dart';

class TodoView extends StatelessWidget {
  final TodoViewModel _viewModel = Get.put(TodoViewModel());

  final TokenStorage _tokenStorage = TokenStorage();

  void _logout() async {
    await _tokenStorage.deleteToken();
    Get.offNamed('/login'); // 로그인 화면으로 이동
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      // body: GetBuilder<_viewModel>(
      //   init: _viewModel(), // GetBuilder에서 사용할 컨트롤러 초기화
      //   builder: (controller) {
      //     // Todo 목록을 표시하는 ListView.builder
      //     return ListView.builder(
      //       itemCount: controller.todos.length,
      //       itemBuilder: (context, index) {
      //         var todo = controller.todos[index];
      //         return ListTile(
      //           title: Text(todo.title),
      //           subtitle: Text(todo.description),
      //           // 여기에 Todo 항목을 탭할 때의 동작을 추가할 수 있습니다.
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
