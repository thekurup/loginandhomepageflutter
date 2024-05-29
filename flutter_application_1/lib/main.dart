import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/splash.dart';

const SAVE_KEY_NAME='UserLOggedin';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'SAMPLE PROJECT',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blue)
      ),home: SreenSplash(),
    );
  }
}