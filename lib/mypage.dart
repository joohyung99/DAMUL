import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {

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
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/IU.jpg'),
                ),
                Column(
                  children: [
                    Text("아이유"),
                    Text("서울대학교 기계항공공학부"),
                    Text("다물 레벨: 골드"),
                  ]
                )
              ]
            ),
            Row(
              children: [
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