import 'package:flutter/material.dart';
import 'dart:math';

class SelectNumberPage extends StatefulWidget {
  const SelectNumberPage({Key? key}) : super(key: key);

  @override
  State<SelectNumberPage> createState() => _SelectNumberPageState();
}

class _SelectNumberPageState extends State<SelectNumberPage> {
  int? selectedIndex;
  //ChoiceChip 선택할 수 있게 해주는 selectedIndex 선언
  List<int> numberSet = [];
  //선택한 번호를 담을 numberSet
  List<int> lottoSet = [];
  //생성된 값을 넣을 lottoSet
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("선택한 번호 중 출력"),
        ),
        body: SingleChildScrollView(
          //기기별로 세로로 초과할 경우에 스크롤 뷰로 나타낼 수 있게 Single Child Scroll View 사용
          child: Center(
              child : Column(
                children: [
                    Wrap(
                      //가로로 길게 나열한 위젯들이 기기의 해상도를 초과할 경우
                      //다음 줄에 나타날 수 있께 해주는 Wrap위젯 이용
                      children: [
                        for (int i = 0; i<45; i++)
                          //위젯을 여러 개 사용해야 하므로 for를 이용한다.
                          ChoiceChip(
                            //로또 번호를 선택할 수 있게 만들어주는 ChoiceChip 사용
                            label: Text("${i+1}"),
                            //해당 ChoiceChip에 번호를 나타내야하므로 적음
                            selected: selectedIndex == i,
                            //selected가 true가 되면 ChoiceChip이 선택되고 false면 선택되지 않는다.
                            onSelected: (newBool){
                              //누르면 효과를 적어주기 위해 onSelected옵션
                              setState(() {
                                //눌렀을 때 화면의 상태를 어떻게 변경시킬지에 대해 적을 setState
                                  selectedIndex = i;
                                  //selectedIndex에 i를 넣어서 해당 번호가 selected에서 true가 되게 만든다.
                                  //이러면 20을 누르면 selected에 20이 들어가고 색칠된 상태로 표시된다.
                                  //이후 5를 누르면 selected에 5가 들어가고 20의 색칠이 지워지고 5에 색칠이 된다.
                                  if(!(numberSet.contains(i+1))) {
                                    //만약 누른 번호가 numberSet에 없다면?
                                    numberSet.add(i+1);
                                    //numberSet에 해당 번호를 누른다.
                                  }
                              });
                              },
                          )

                      ],
                    ),
                  Text("${numberSet.toString()}"),
                  //누른 숫자가 뭐가 있는지 보여주기 위함
                  ElevatedButton(onPressed: (){
                    //셔플 버튼
                    setState(() {
                      //넘버셋에서 숫자 6개 출력하는 버튼 구현
                      if(numberSet.length>=6){
                        //numberSet의 개수가 6 이상일 때 가능
                        List<int> tmp = [];
                        //지금까지 어떤 인덱스를 넣었는지 알 수 있게 해주는 tmp선언
                        lottoSet.clear();
                        //여러 번 누를 수 있기 때문에 누를때마다 전의 결과값을 초기화 해주게 clear를 사용
                        while(true){
                          //반복문을 통해 lottoSet에 원하는 숫자들이 들어갈 때까지 무한 반복
                          int rnd = Random().nextInt(numberSet.length);
                          //rnd 변수에 선택한 숫자들길이에서 랜덤으로 숫자를 꺼냄
                          if(!tmp.contains(rnd)){
                            //해당 반복의 rnd가 나온 적 없던 숫자라면
                            lottoSet.add(numberSet[rnd]);
                            //lottoSet에 numberSet의 인덱스 rnd에 해당하는 숫자를 넣음

                            tmp.add(rnd);
                            //rnd가 나왔었으므로 tmp에 넣음
                          }
                          if(lottoSet.length ==6){
                            //lottoSet길이가 6이 되면 미션 클리어
                            lottoSet.sort();
                            //정렬한다.
                            break;
                          }
                        }
                      }
                    });
                  }, child:Text("위의 numberSet에서 셔플")),
                  Text("${lottoSet}",style: TextStyle(fontSize: 34),),
                  //출력
                  ElevatedButton(onPressed: (){
                    //numberSet초기화 하는 버튼
                    setState(() {
                      numberSet.clear();
                    });
                  }, child: Text("선택한 숫자 초기화")),
                  SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.warning_amber,size: 50,color: Colors.redAccent,),Text("6개 이상 고르지 않으시면\n셔플이 작동하지 않습니다.",style:TextStyle(color: Colors.red,fontSize: 25))]),
                ],
              )
          ),
        ),
      ),
    );
  }
}
