import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../ViewModel/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  // TextEditingController idController
  final LoginViewModel _viewModel = Get.put(LoginViewModel());

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
                'TODO', // 임시 Logo
                style: TextStyle(
                  fontFamily: 'NotoSans-ThinItalic',
                  fontSize: 40.0, // 텍스트 크기
                  fontWeight: FontWeight.bold, // 텍스트 굵기
                  // fontWeight: FontWeight.w100
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                // controller: ,
                decoration: InputDecoration(
                  hintText: 'Enter your ID',
                  labelText: 'ID',
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
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
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 로그인 버튼이 클릭 되었을 때의 동작 추가
                print("Login Button !!!");
                _viewModel.login('johnjeongukhur', 'Test1234!');

              },
              child: const Text('Login',
              style: TextStyle(
                fontFamily: "NotoSans",
                fontSize: 20,
              fontWeight: FontWeight.normal)),
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

