import 'package:flutter/material.dart';
import '../model/user.dart';
import 'survey_2.dart';
// import 'package:flutter_session/flutter_session.dart';

class ProsesLogin extends StatelessWidget{
  final User user;

  ProsesLogin({required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Text(user.name),
          Text(user.email),
          Text(user.password),
          FloatingActionButton(
            child: Icon(Icons.arrow_forward),
            backgroundColor: Colors.purple,
            elevation: 0,
            onPressed: (){
              // var session = FlutterSession();
              // session.set('nama', user.nama);
              // session.set('email', user.email);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey_2()));
            },
          )
        ],
      ),
    );
  }

}