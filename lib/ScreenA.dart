import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  int acceptedData = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              LongPressDraggable<int>(
                data: 10,
                  feedback: Container(
                height: 100,
                width: 100,
                color: Colors.black,
              ),
                   childWhenDragging: Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                ),
                child: Container(
                  color: Colors.blue,

                ),



              ),
              DragTarget<int>(builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
              )
              {
                return Container(
                  height: 100,
                width: 100,
                  color: Colors.lime,
                );
              },
                onAccept: (int data) {
                  setState(() {
                    acceptedData += data;
                  });
                },
              )
            ],
          )
      ),
    );
  }
}
