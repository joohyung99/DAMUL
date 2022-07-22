
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class become_newmember extends StatefulWidget {
  const become_newmember({Key? key}) : super(key: key);

  @override
  State<become_newmember> createState() => _become_newmemberState();
}

class _become_newmemberState extends State<become_newmember> {

  final _authentication = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation(){
    final isvalid = _formkey.currentState!.validate();
    if(isvalid){
      _formkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
              children: [
                Form(
                  key: _formkey,
                  child: Theme(
                    data: ThemeData(
                        primaryColor: Colors.black,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(
                              color: Colors.teal,
                              fontSize: 12.0,
                            )
                        )
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty || value.length < 2){
                                return '최소 두 글자의 닉네임을 입력하셔야 합니다.';
                              }
                              return null;
                            },
                            onSaved: (value){
                              userName = value!;
                            },
                            onChanged: (value){
                              userName = value;
                            },
                            decoration: InputDecoration(
                              label: Text("닉네임"),
                              hintText: "두 글자 이상의 닉네임을 입력하세요.",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),

                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty || !value.contains('@')){
                                return '유효한 메일 주소를 입력해주세요.';
                              }
                              return null;
                            },
                            onSaved: (value){
                              userEmail = value!;
                            },
                            onChanged: (value){
                              userEmail = value;
                            },
                            decoration: InputDecoration(
                              label: Text("이메일"),
                              hintText: "자주 사용하는 이메일 주소를 입력해주세요.",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty || value.length < 6){
                                return '6자리 이상의 비밀번호를 입력해주세요.';
                              }
                              return null;
                            },
                            onSaved: (value){
                              userPassword = value!;
                            },
                            onChanged: (value){
                              userPassword = value;
                            },
                            decoration: InputDecoration(
                              label: Text("비밀번호 설정"),
                              hintText: "비밀번호는 6자리 이상이어야 합니다.",
                              hintStyle: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty || value != userPassword){
                                return '비밀번호가 일치하지 않습니다.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text("비밀번호 확인"),
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          SizedBox(height: 50,),
                          FloatingActionButton(
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.zero
                            ),
                            child: Container(child: Text("다음")),
                            onPressed: () async{
                              _tryValidation();

                              try {
                                final newUser = await _authentication
                                    .createUserWithEmailAndPassword(
                                  email: userEmail,
                                  password: userPassword,
                                );
                                if(newUser.user != null){
                                  //다음페이지로 이동
                                }
                              }catch(e){
                                print(e);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('이메일과 비밀번호를 다시 설정하세요.'),
                                    backgroundColor: Colors.blue,
                                  )
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
        )
      ),
    );
  }

}
