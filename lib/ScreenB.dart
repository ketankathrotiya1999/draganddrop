
import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  List<Color> colos = [
    Colors.black,
    Colors.pink,
    Colors.lime,
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.brown,
    Colors.cyanAccent,
    Colors.purple,
  ];
  Color boxcolor = Colors.purpleAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 120,),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colos.length,
              itemBuilder: (context, index) {
                return LongPressDraggable<Color>(
                  data:colos[index] ,
                  feedback: Container(
                    margin: EdgeInsets.all(10),
                    color: colos[index],
                    height: 50,
                    width: 50,

                  ),
                  childWhenDragging: Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    width: 50.0,
                    color: colos[index],
                    child: const Center(

                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    width: 50.0,
                    color: colos[index],
                    child: const Center(

                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 120,),
          DragTarget<Color>(
            builder: (context, candidateData, rejectedData) {
              return CircleAvatar(
                radius: 150,
                backgroundColor: boxcolor,
              );
            },
            onAccept: (data) {
              setState(() {
                boxcolor = data;
              });
            },
          ),
        ],
      ),
    );
  }
}
