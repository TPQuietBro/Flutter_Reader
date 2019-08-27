import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:znovel_flutter/Reader/Model/FontModel.dart';

class ReaderFontSelector extends StatelessWidget{
  final FontModel fontModel;
  final Function fontChaneCallBack;
  final List _fontSizes = [13.0,14.0,15.0];
  double _lastFont = 0.0;
  ReaderFontSelector({this.fontModel,this.fontChaneCallBack});


  List<Widget> _subWidgets(){
    List<Widget> widgets = [];
    _fontSizes.forEach((ele){
      GestureDetector detector = GestureDetector(
            onTap: (){
              if (_lastFont == ele) {
                return;
              }
              _lastFont == ele;

              if(this.fontChaneCallBack != null) {
                this.fontChaneCallBack();
              } 

              this.fontModel.setFontSize(ele);
            },
            child: Container(
              color: Colors.orange,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              width: 50,
              child: Text(ele.toString()),
            ),
          );
      widgets.add(detector);
    }); 
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: _subWidgets()
      ),
    );
  }
}