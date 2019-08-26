import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:znovel_flutter/Reader/Model/ThemeModel.dart';

class ReaderTheme extends StatelessWidget{
  final ThemeModel themeModel;
  ReaderTheme({this.themeModel});
  final List _colors = [Colors.white,Colors.black,Colors.brown,Colors.green,Colors.purple];
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              if (index == 1) {
                this.themeModel.setTextColor(Colors.grey);
              } else {
                this.themeModel.setTextColor(Colors.black);
              }
              this.themeModel.setThemeColor(_colors[index]);
            },
            child: Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: _colors[index],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              )
            ),
            width: 45,
            height: 30,
            ),
          );
        },
      ),
    );
  }
}