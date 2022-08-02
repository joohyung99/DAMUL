import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("마이페이지"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                  children: [
                    SizedBox(width: 20,),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/IU.jpg'),
                      radius: 30,
                    ),
                    SizedBox(width: 10,),
                    Column(
                        children: [
                          Container(
                            child: Text("아이유"),
                          ),

                          Text("서울대학교 기계항공공학부"),
                          Text("다물 레벨: 골드"),
                        ]
                    )
                  ]
              ),
              Row(
                  children: [
                    SizedBox(width: 20,),
                    TextButton(
                      child: Text("과외 일정보기"),
                      onPressed: (){},
                    ),
                    TextButton(
                      child: Text("프로필 수정"),
                      onPressed: (){},
                    )
                  ]
              )
            ]

        )

    );
  }
}
