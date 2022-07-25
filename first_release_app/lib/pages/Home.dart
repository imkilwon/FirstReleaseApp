import 'package:first_release_app/pages/EntireNumber.dart';
import 'package:first_release_app/pages/DeleteHome.dart';
import 'package:first_release_app/pages/SelectNumber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //노치와 같은 기기별 특성에 앱바가 영향을 받지 않도록 SafeArea 사용
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lottery Number Generate"),
        ),
        body: Center(
          child:Column(
            //세로로 배열을 위해 Column 사용
            mainAxisAlignment: MainAxisAlignment.center,
            //Column(세로)에 대해 Center에 배열
            children: [
              ElevatedButton(onPressed: (){
                //페이지 이동 버튼 ElevatedButtond으로 구현
                Get.to(EntireNumberGeneratorHome());
                //Get.to로 페이지 이동
              }, child: Text("전체번호")),

              SizedBox(height: 150,),
              //버튼 별 여백을 주기 위한 SizedBox 이용
              ElevatedButton(onPressed: (){
                Get.to(SelectNumberPage());
              }, child: Text("선택한 번호")),
            ],
          )
        )
      ),
    );
  }
}
