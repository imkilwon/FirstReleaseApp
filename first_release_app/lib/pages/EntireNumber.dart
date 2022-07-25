import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class EntireNumberGeneratorHome extends StatefulWidget {
  const EntireNumberGeneratorHome({Key? key}) : super(key: key);

  @override
  State<EntireNumberGeneratorHome> createState() => _EntireNumberGeneratorHomeState();
}

class _EntireNumberGeneratorHomeState extends State<EntireNumberGeneratorHome> {

  List<int> _lottoSet =[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text("전체 번호 중 선택"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  //버튼을 누르면
                  List<int> lottoSet = [];
                  //번호를 담을 lottoSet을 만든다
                  lottoSet.clear();
                  //여러 번 누를 수 있기 때문에 누를 때마다 clear할 수 있게 만듦
                  while(true){
                    var rnd = Random().nextInt(45)+1;
                    //1~45까지 수에서 랜덤하게 하나씩 뽑음

                    if (!lottoSet.contains(rnd)){
                      //lottoSet에 랜덤 숫자가 없다? == 중복되지 않은 숫자
                      lottoSet.add(rnd);
                      //lottoSet에 넣음
                    }
                    if(lottoSet.length == 6){
                      lottoSet.sort();
                      //lottoSet의 개수가 원하는 만큼 되면 정렬하고 탈출
                      break;
                    }
                  }
                  _lottoSet = lottoSet;
                  //누를 때마다 업데이트를 해준다 출력할 때 사용하는 변수 _lottoSet에
                });
              },
                child: const Text("1~45 번호 중 랜덤하여 생성", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200)
              ),),
              Text("${_lottoSet.toString()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
