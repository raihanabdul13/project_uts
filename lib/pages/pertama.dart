import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'survey_2.dart';
import 'package:project_uts/model/preferensi.dart';

Future<User> register(String name, String email, String password) async{
  var url = 'http://192.168.0.2/api/mobiles';
  final response = await http.post(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'name' : name,
        'email': email,
        'password': password
      }
  );

  if(response.statusCode == 200) {
    User user = User(name, email, password);
    return user;
  }
  else{
    throw Exception('hallo');
  }
}

class PertamaPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Pertama();
  }
}

class Pertama extends State<PertamaPage>{
// class Pertama extends StatelessWidget{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _nama = TextEditingController();
  final user = User('', '', '');
  bool _submit = false;
  Future<User>? _register;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              )
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 140,
                          child: Text(
                            "CREATE NEW ACCOUNT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                ),
                new Image.asset(
                  'assets/user_pic.png',
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nama,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(10)
                          ),
                          labelText: 'Full Name',
                        ),
                        validator: RequiredValidator(errorText: "Tidak Boleh Kosong!"),

                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                      ),
                      TextFormField(
                        controller: _email,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10)
                          ),
                          labelText: 'Email',
                        ),
                        validator: MultiValidator([
                          EmailValidator(errorText: "Format Email Salah"),
                          RequiredValidator(errorText: "Tidak boleh kosong!")
                        ]),

                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                      ),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10)
                          ),
                          labelText: 'Password',
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Tidak Boleh Kosong"),
                          MinLengthValidator(6, errorText: "Min Length 6 Char!")
                        ])

                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                      ),
                      TextFormField(
                        controller: _confirmPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10)
                          ),
                          labelText: 'Confirm Password',
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Harus Diisi!";
                          }
                          return MatchValidator(errorText: "Password tidak sama").validateMatch(val, _password.text);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                ),
                (_submit == false) ? button() : buildFuture(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button(){
    return FloatingActionButton(
      child: Icon(Icons.arrow_forward),
      backgroundColor: Colors.purple,
      elevation: 0,
      onPressed: (){
        if(formkey.currentState!.validate()){
          setState((){
            _submit = true;
          });
          _register = register(_nama.text, _email.text, _confirmPass.text);
        }
      },
    );
  }

  FutureBuilder<User> buildFuture(){
    return FutureBuilder<User>(
        future: _register,
        builder: (context, snapshot){
          if(snapshot.hasData){
            Preferensi().setNama = snapshot.data!.name;
            Preferensi().setEmail = snapshot.data!.email;
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey_2()));
            });
            return Text('Registrasi Berhasil');
          }
          else if(snapshot.hasError){
              return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        }
    );
  }
}



