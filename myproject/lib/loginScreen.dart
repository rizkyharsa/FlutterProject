// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //NEW
      body: Container(
        padding: const EdgeInsets.all(30.0), //NEW
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //NEW
          children: <Widget>[
            Image.asset(
              'assets/splash.jpg',
              width: 180,
              height: 180,
            ),
            const TextField(
                decoration: InputDecoration(
              labelText: 'Email',
            )),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              //NEW
              minWidth: 300,
              color: Colors.black,
              textColor: Colors.white,
              elevation: 15,
              onPressed: _onPress,
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                //NEW
                onTap: _onRegister,
                child: const Text('Register New Account',
                    style: TextStyle(fontSize: 16))),
            GestureDetector(
                onTap: _onForgot,
                child: const Text('Forgot Account', style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }

  void _onPress() {
    print('Press');
  }

  void _onRegister() {
    print('Register');
  }

  void _onForgot() {
    print('Forgot');
  }
}
