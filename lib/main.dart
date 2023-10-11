import 'package:flutter/material.dart';
import 'package:first_flutter_project/View/splash_view.dart';
import 'package:first_flutter_project/View/login_view.dart';
import 'package:get/get.dart';

import 'API/keychain.dart';
import 'View/todo_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String? token = await TokenStorage().readToken();

  runApp(MyApp(initialRoute: '/splash'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Splash Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashView()),
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/todo', page: () => TodoView()),
      ],
    );
  }
}
