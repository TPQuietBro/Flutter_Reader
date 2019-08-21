import 'package:flutter/material.dart';
import 'package:znovel_flutter/Classify/GlobalEvent.dart';

class ClassifyCWidget extends StatefulWidget{
@override

ClassifyCWidgetState createState() => ClassifyCWidgetState();
}
class ClassifyCWidgetState extends State<ClassifyCWidget>{
@override

Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text("C"),
  ),
  body: Center(
    child: FlatButton(
      onPressed: (){
        GlobalEventBus().event.fire(BackgroundColorChangeEvent(Colors.red));
      },
      child: Text('setColor'),
    ),
  ),
);
}
}