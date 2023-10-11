import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import '../API/keychain.dart'; // KeychainManager의 대체로 사용 - flutter_secure_storage 패키지 사용하기 위해 추가

class SplashView extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    loadInitialRoute();
  }

  Future<void> loadInitialRoute() async {
    String? token = await TokenStorage().readToken();

    String initialRoute = token != null ? '/todo' : '/login';
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, initialRoute);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Todo Loading...",
          style: TextStyle(
            fontFamily: "NotoSans",
            fontSize: 24.0, // 텍스트 크기
            fontWeight: FontWeight.bold, // 텍스트 굵기
            color: Colors.black, // 텍스트 색상
          ),
        ),
      ),
    );
  }
}
