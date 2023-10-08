import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Todo', // 표시할 Todo 텍스트
                style: TextStyle(
                  fontFamily: 'NotoSans-ThinItalic',
                  fontSize: 40.0, // 텍스트 크기
                  // fontWeight: FontWeight.light, // 텍스트 굵기
                  // fontWeight: FontWeight.w100
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your ID',
                  labelText: 'ID',
                ),
                style: TextStyle(
                  fontSize: 16.0, // 텍스트 크기
                  color: Colors.black, // 텍스트 색상
                  fontWeight: FontWeight.bold, // 텍스트 굵기
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
                style: TextStyle(
                  fontSize: 16.0, // 텍스트 크기
                  color: Colors.black, // 텍스트 색상
                  fontWeight: FontWeight.bold, // 텍스트 굵기
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 로그인 버튼이 클릭되었을 때의 동작 추가
                print("Login Button !!!");
              },
              child: const Text('Login'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width - 40, 50),
                ), // 버튼의 크기를 기기 가로 크기에서 좌우 여백(20)을 뺀 값 설정
              ),
            ),
          ],
        ),
      ),
    );
  }
}

