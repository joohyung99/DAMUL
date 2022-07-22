
import 'dart:math';
import 'package:flutter/material.dart';

import 'Main/home.dart';
import 'newmember/newmember.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _authentication = FirebaseAuth.instance;
  final _loginformkey = GlobalKey<FormState>();
  TextEditingController ctr1 = TextEditingController();
  TextEditingController ctr2 = TextEditingController();
  String ID = '';
  String pw = '';

  void _logintryValidation(){
    final isvalid = _loginformkey.currentState!.validate();
    if(isvalid){
      _loginformkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
              ),
              Form(
                key: _loginformkey,
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.black,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15.0,
                      )
                    )
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty || !value.contains('@')){
                              return '아이디는 회원가입 시 입력하신 이메일 주소입니다.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Enter ID"
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value){
                            ID = value!;
                          },
                          onChanged: (value){
                            ID = value;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Enter Password"
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onSaved: (value){
                            pw = value!;
                          },
                          onChanged: (value){
                            pw = value;
                          },
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: FloatingActionButton(
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.zero
                            ),
                            child: Container(child: Text("로그인")),
                            onPressed: () async{
                              _logintryValidation();
                              try {
                                final loginUser = await _authentication
                                    .signInWithEmailAndPassword(
                                  email: ID,
                                  password: pw,
                                );
                                if(loginUser.user != null){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context){
                                      return home();
                                    })
                                  );
                                }
                              }catch(e){
                                print(e);
                              }
                              // ctr1, ctr2가 실제 회원정보와 일치하다면 메인 페이지로 이동

                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("아직 다물 회원이 아니신가요?", style: TextStyle(fontSize: 11, color: Colors.grey)),
                            SizedBox(width: 10),
                            InkWell(
                              child: Text("회원가입", style: TextStyle(fontSize: 11, color: Colors.grey),),
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (BuildContext context)=>newmember())
                                  );
                                },
                            )
                          ],
                        )
                      ],
                    ),
                  ))
              )
            ],
          ),
        ),
      ),
    );
  }

  void dispose(){
    ctr1.dispose();
    ctr2.dispose();
    super.dispose();
  }

}
