

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Home'),
      actions: [IconButton(onPressed: (){
        alretbox(context);
      }, icon: Icon(Icons.logout))],
    ),
      body: ListView.separated(
          itemBuilder:(
          BuildContext context,int index){
          if(index%3==0){
         return ListTile(
            title: Text('Friend $index'),
            subtitle: Text('$index unreaded messages'),
            leading: CircleAvatar(
               backgroundImage: NetworkImage('https://imgs.search.brave.com/Fy1RCBm3QMhpqgWgV6-9Plj4YRLAHJveKlznSKiP9zk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJzLmNvbS9p/bWFnZXMvZmVhdHVy/ZWQvdGhvci1waWN0/dXJlcy0xOXZqNXc2/MGwxdzM0Z2NtLmpw/Zw'),
            radius: 45,),
            trailing: Text('1$index:3$index PM'),
          );}else{
            return Padding(
              padding: EdgeInsets.only(left: 17),
              child: ListTile(
                leading: ClipRRect( 
                  child: Image.network('https://imgs.search.brave.com/XqGZt7S0g-RNSESLZwdRDGdM6citkgIQdhdxNxP48Hk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJzLmNvbS9p/bWFnZXMvZmVhdHVy/ZWQvc3BpZGVybWFu/LXBpY3R1cmVzLThv/cGY4cTRzbW1weDY0/NGQuanBn'),
                  
                ),
                title: Text('Friend $index'),
              subtitle: Text('$index unreaded messages'),
               trailing: Text('1$index:3$index PM'),
              ),
            );
          }
        },
         separatorBuilder: (BuildContext context,int index){
          return Divider();
        }, itemCount: 10)
    );
  }
}

void alretbox(context){
  print('njn ivite ethi')
;  showDialog(context: context, builder: (context){
  return  AlertDialog(
        content: Text('are you want to logout!!'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('No')),
          TextButton(
              onPressed: ()async {
              final sha=  await SharedPreferences.getInstance();
              await sha.clear();
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SreenSplash()), (route) => false);
              },
              child: const Text('Yes'))
        ],
      );
});

}