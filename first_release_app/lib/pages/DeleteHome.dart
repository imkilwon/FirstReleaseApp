import 'package:first_release_app/pages/EntireNumber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'dart:math';

class lottoHome extends StatefulWidget {
  const lottoHome({Key? key}) : super(key: key);

  @override
  State<lottoHome> createState() => _lottoHome_State();
}

class _lottoHome_State extends State<lottoHome> {

  List<int> _lottoSet =[];
  //전체 번호 중 랜덤하게 추출하는 set를 담을 리스트 생성
  List<int> _wantSet = [];
  //원하는 번호 중 랜덤하게 추출하는 set을 담을 리스트 생성
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Lottery Number Generate"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              Get.to(EntireNumberGeneratorHome());
            });
          }, child: Text("전체 번호 중 출력")),
          SizedBox(
              height: 20
          ),
          Center(child: ElevatedButton(onPressed: (){
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
          }, child: Text("1~45 번호 중 랜덤하여 생성",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200))),),
          Text("${_lottoSet.toString()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          //=========모든 번호 중 랜덤하게 생성하게 하는 것 ===========
          SizedBox(height: 100),
          Center(child:ElevatedButton(
            child: Text("1,2,17,19,25,28,33,37 중 번호 생성"),
            onPressed: (){
              setState(() {
                List<int> wantSet =[1,2,17,19,25,28,33,37];
                _wantSet.clear();
                List<int> tmp = [];
                tmp.clear();
                while(true){
                  var rnd = Random().nextInt(8)+1;
                  if (!tmp.contains(rnd)){
                    //tmp안에 랜덤한 인덱스 하나 뽑은게 없다면
                    _wantSet.add(wantSet[rnd-1]);
                    tmp.add(rnd);
                  }
                  if(_wantSet.length == 6){
                    _wantSet.sort();
                    break;
                  }
                }
              });
            },
          ),

          ),
          Text("${_wantSet.toString()}"),
        ],

      ),
    );
  }
}
