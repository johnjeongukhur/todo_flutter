import 'package:flutter/material.dart';
import 'package:first_flutter_project/View/splash_view.dart';
import 'package:first_flutter_project/View/login_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashView(),
        '/login': (context) => LoginView(),
      },
    );
  }
}
