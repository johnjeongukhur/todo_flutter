import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart'; // KeychainManager의 대체로 사용 - flutter_secure_storage 패키지 사용하기 위해 추가

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
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
