import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../ViewModel/login_viewmodel.dart';

class LoginView extends StatelessWidget {
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
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                onChanged: _viewModel.username,
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
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                onChanged: _viewModel.password,
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
                // _viewModel.login();
                _viewModel.login();

              },
              child: const Text(
                'Login',
                style: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width - 40, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

