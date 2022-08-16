// ignore_for_file: library_private_types_in_public_api, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.blue));
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/splash.jpg',
                scale: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              const ProgressIndicator(),
            ],
          )),
        ));
  }
}

class ProgressIndicator extends StatefulWidget{
  const ProgressIndicator({super.key});

  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator> 
with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value > 0.99) {
            print('Sucess Login');
            //loadpref(this.context);
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: ((context) => const loginPage())));
          }
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          child: const LinearProgressIndicator(),
        ));
  }
}

