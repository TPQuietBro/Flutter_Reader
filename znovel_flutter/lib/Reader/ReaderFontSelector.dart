import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReaderFontSelector extends StatelessWidget{
  final Function callBack;
  ReaderFontSelector({@required this.callBack});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              this.callBack(13.0);
            },
            child: Container(
              color: Colors.orange,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              width: 50,
              child: Text('13'),
            ),
          ),
          GestureDetector(
            onTap: (){
              this.callBack(14.0);
            },
            child: Container(
              color: Colors.orange,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10),
              width: 50,
              child: Text('14'),
            ),
          ),
          GestureDetector(
            onTap: (){
              this.callBack(15.0);
            },
            child: Container(
              color: Colors.orange,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10),
              width: 50,
              child: Text('15'),
            ),
          ),
        ],
      ),
    );
  }
}