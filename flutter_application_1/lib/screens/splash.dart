
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SreenSplash extends StatefulWidget {
  const SreenSplash({super.key});

  @override
  State<SreenSplash> createState() => _SreenSplashState();
}

class _SreenSplashState extends State<SreenSplash> {
  void initState(){
    checkUSerLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Center(
        child: Text("Loading"),
      ),
    );
  }

  Future<void>gotologin()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Screenlogin()));
    
  }

  Future<void>checkUSerLogin()async{
    final _sharedpref=await SharedPreferences.getInstance();
    final _userLoggedIn= _sharedpref.getBool(SAVE_KEY_NAME);
    if(_userLoggedIn==null||_userLoggedIn==false){
      gotologin( );
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenHome()));
    }
  }
}