
import 'dart:math';
import 'package:flutter/material.dart';

import 'newmember.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController ctr1 = TextEditingController();
  TextEditingController ctr2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
            ),
            Form(
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
                      TextField(
                        controller: ctr1,
                        decoration: InputDecoration(
                          labelText: "Enter ID"
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: ctr2,
                        decoration: InputDecoration(
                            labelText: "Enter Password"
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
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
                          onPressed: (){
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
    );
  }

  void dispose(){
    ctr1.dispose();
    ctr2.dispose();
    super.dispose();
  }

}
