import 'package:flutter/material.dart';
import 'package:sliverapp/ad.dart';
import 'package:sliverapp/diary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 안에 Sliver 타입을 적어야하는 이유는
          // 계산을 하여 CustomScrollView에 줘야하는데 이게 Sliver타입만 가능
          SliverAppBar(
            snap: true,
            floating: true,
            title: Text("SliverAppbar"),
            pinned: false,
            expandedHeight: 250,
            flexibleSpace: Container(
              child: Center(
                child: Text(
                  "FlexibleSpace",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
                height: 200,
                color: Colors.red,
              )
          ),


          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount: 10,
          //     (context, index) {
          //       return Text("안녕");
          //     },
          //   ),
          // ),
          // SliverAppBar(
          //   title: Text("SliverAppbar"),
          //   pinned: true,
          // ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
                  (context, index) {
                if (index % 4 == 0 && index != 0) {
                  return Ad((index / 4).toInt());
                } else {
                  return Diary(index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Container(
            height: 100,
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text("List Item $index"),
          );
        },
      ),
    );
  }
}
