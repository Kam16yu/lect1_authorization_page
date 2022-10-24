import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/splash_screen.dart';


void main() async{
  //Init and opening Hive database
  await Hive.initFlutter();
  await Hive.openBox('authorizationBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 1 app',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
        home: const SplashScreen()
    );
  }
}
