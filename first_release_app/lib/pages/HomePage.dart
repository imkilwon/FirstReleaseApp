import 'package:flutter/material.dart';

class lottoHome extends StatelessWidget {
  const lottoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("로또 번호 추첨기"),
            backgroundColor: Colors.lime,
            floating: true,
            pinned: false,
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              IconButton(
                icon: Icon(Icons.shuffle_rounded),
                onPressed: (){
                  
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
