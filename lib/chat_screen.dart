import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  final int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("다물"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(height: 30,),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Text("~~ 후에 과외 일정이 있습니다.", style: TextStyle(fontSize: 30)),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                    borderRadius: BorderRadius.circular(10),
                )
            ),
            onTap: (){},
          ),
          InkWell(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Text("~~ 명의 학생이 수업을 기다리고 있습니다.", style: TextStyle(fontSize: 30)),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
            ),
            onTap: (){},
          ),
          Row(
            children: [
                InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("선생님 가이드", style: TextStyle(fontSize: 30)),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  onTap: (){},
                ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("선생님 랭킹", style: TextStyle(fontSize: 30)),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
                onTap: (){},
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "홈"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: "과외 매칭"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "마이페이지"
          ),
        ],
        currentIndex: selectIndex,
        onTap: (idx){
          if(idx == 1){
            //과외 매칭 페이지로 이동
          };
          /*setState(() {
            selectIndex = idx;
          });*/
        },
      ),
    );
  }

}

