import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReaderPainter extends CustomPainter{

  final String content;
  ReaderPainter({@required this.content});

  TextPainter _painter;

  @override
  void paint(Canvas canvas, Size size) {
    _repaint(canvas, size, this.content);
  }

  _repaint(Canvas canvas,Size size,String string){
    _painter = _textPainter(string);
    _painter.layout(maxWidth: size.width,minWidth: 0);
    _painter.paint(canvas, Offset(0, 0));
  }

  TextPainter _textPainter(String content){
    return TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: content??'',
            style: TextStyle(color: Colors.black, fontSize: 14),
            recognizer: _tapGesture()
            )
          );
  }

  TapGestureRecognizer _tapGesture(){
    TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
    tapGestureRecognizer.onTap = (){
      print('onTap');
    };
    return tapGestureRecognizer;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}