import 'dart:async';

import 'package:flutter/material.dart';
import 'package:znovel_flutter/Classify/B.dart';
import 'package:znovel_flutter/Classify/GlobalEvent.dart';

class ClassifyWidget extends StatefulWidget{
@override

ClassifyWidgetState createState() => ClassifyWidgetState();
}
class ClassifyWidgetState extends State<ClassifyWidget>{

  Color _bgColor = Colors.white;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onlisten();
  } 

   @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ClassifyWidget oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('A deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  _onlisten(){
    GlobalEventBus().event.on<BackgroundColorChangeEvent>().listen((event){
      setState(() {
        _bgColor = event.color;
      });
    });
  } 


  String say() {
    print('1');
    return 'hello';
  }

  void feedback()async{
    print('2');
  }

  Future<String> request1() async{
     return 'hello';
  }

  Future<String> request2(String value) async{
     return '$value + lily';
  }
@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text("分类"),
  ),
  body: Center(
    child: Container(
      color: _bgColor,
      child: FlatButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return ClassifyBWidget();
        }));
      },
      child: Text('to B'),
     ),
    )
  ),
);
}
}
