
import 'package:flutter/material.dart';
import 'become_newmember.dart';

class newmember extends StatefulWidget {
  const newmember({Key? key}) : super(key: key);

  @override
  State<newmember> createState() => _newmemberState();
}

class _newmemberState extends State<newmember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
        backgroundColor: Colors.black,
      ),
      body: become_newmember(),
    );
  }
}
