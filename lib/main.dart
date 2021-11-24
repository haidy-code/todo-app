import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'file:///C:/flutter%20projects/todo_app/lib/home/HomeScreen.dart';
import 'file:///C:/flutter%20projects/todo_app/lib/home/MythemeData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MythemeData.lighttheme,
      routes: {
        HomeScreen.routename: (buildcontext) => HomeScreen()
      },
      initialRoute: HomeScreen.routename,

    );
  }
}