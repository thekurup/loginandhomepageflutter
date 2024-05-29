import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenlogin extends StatefulWidget {
   Screenlogin({super.key});

  @override
  State<Screenlogin> createState() => _ScreenloginState();
}

class _ScreenloginState extends State<Screenlogin> {
final _usernameCntrl = TextEditingController();

final _passwordcntl=TextEditingController();

final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                
                controller: _usernameCntrl,
                decoration: InputDecoration( 
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return 'value is empty';
                  }else{
                    return null;
                  }
                },
              ),SizedBox(height: 10,),
                TextFormField(
                 
                  controller: _passwordcntl,
                decoration: InputDecoration( 
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  
                ),
                 validator: (value) {
                  if(value==null||value.isEmpty){
                    return 'value is empty';
                  }else{
                    return null;
                  }}
              ),SizedBox(height: 10,),
              ElevatedButton.icon(onPressed: (){
                checklogin(context);
              }, icon: Icon(Icons.check), label: Text('Login'))
            ],
          ),
        )),
      ),
    );
  }

  void checklogin(BuildContext context)async{
    final _username =_usernameCntrl.text;
    final _password =_passwordcntl.text;
    if(_username=='arjun'&&_password=='0102'){
      final _sharedpref= await SharedPreferences.getInstance();
      await _sharedpref.setBool(SAVE_KEY_NAME, true);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenHome()));
    }else if(_username !='arjun'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Username you Entered is Incorrect'),
        backgroundColor: Color.fromARGB(255, 189, 18, 5),
      ));

      }else if(_password !='0102'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password you Entered is Incorrect'),
        backgroundColor: Color.fromARGB(255, 189, 18, 5),
      ));

      }else{
        

      }

      
    }
  }
