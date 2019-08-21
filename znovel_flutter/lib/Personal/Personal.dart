import 'package:flutter/material.dart';

class PersonalWidget extends StatefulWidget{
@override

PersonalState createState() => PersonalState();
}
class PersonalState extends State<PersonalWidget>{
@override

Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text("我的"),
  ),
);
}
}