import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:znovel_flutter/Reader/Util/ReaderUtil.dart';

class ReaderPainter extends CustomPainter{

  final String content;
  final double fontSize;
  final Color themeColor;

  ReaderPainter({@required this.content,this.fontSize = 14.0,this.themeColor = Colors.black});

  TextPainter _painter;

  @override
  void paint(Canvas canvas, Size size) {
    _repaint(canvas, size, this.content);

    // TextPainter painter = _tempPainter(50, 30);
    // painter.layout(maxWidth: 100);
    // print('painter size : ${painter.size}');
    // painter.paint(canvas, Offset(0, 0));
  }

  _repaint(Canvas canvas,Size size,String string){
    _painter = _textPainter(string);
    _painter.layout(maxWidth: size.width,minWidth: 0);
    _painter.paint(canvas, Offset(0, 0));
  }

  TextPainter _textPainter(String content){
    return TextPainter(
        textDirection: TextDirection.ltr,
        text:ReaderUtil.textSpan(content,fontSize: this.fontSize,color: this.themeColor)
          );
  }

  double heightToFontSize(double dp) {
    double fontSize = dp / 30.0 * 26.0;
    return fontSize;
  }

  TextPainter _tempPainter(double width,double height){
    return TextPainter( 
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: '\u200B',
        style: TextStyle(
          height: 1,
          fontSize: heightToFontSize(height),
          letterSpacing: width,
          backgroundColor: Colors.red
        )
      )
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}