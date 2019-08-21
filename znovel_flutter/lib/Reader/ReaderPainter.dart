import 'dart:ui';

import 'package:flutter/material.dart';


class ReaderPainter extends CustomPainter{
  final String content;
  ReaderPainter({@required this.content});
  int get page => _page;
  int _page = 0;
  int _totalOffset = 0;

  Map get pageMap => _pageMap;
  Map _pageMap = {};

  TextPainter _painter;

  @override
  void paint(Canvas canvas, Size size) {
    print('content length = ${this.content.length}');
    _painter = _textPainter(this.content);
    _painter.layout(maxWidth: size.width,minWidth: 0);
    double paintHeight = _painter.size.height;
    int contentHeight = this.content.length;
    print('paint height = ${_painter.size.height} , contentHeight : ${size.height}');

    // if (_isExceed(_painter.size.height, size)) {
    //   page ++;
    //   print('over');
    //   TextPosition position = _painter.getPositionForOffset(Offset(size.width, size.height));
    //   String string = content.substring(0,position.offset);
    //   print('position = $position string = $string');

    //   _repaint(canvas, size, string);
    // } else {
    //   _painter.paint(canvas, Offset(0, 0));
    // }

    // while (_isExceed(_painter.size.height, size.height)) {
    //   TextPosition position = _painter.getPositionForOffset(Offset(size.width, size.height));
    //   String string = content.substring(0,position.offset);
    //   _repaint(canvas, size, string);
    //   page ++;
    // }
    // print('page = $page');
    _caculatePages(paintHeight, size, content);
    
    if (contentHeight - _totalOffset > 0) {
      _page ++;
      _pageMap[_page] = this.content.length - _totalOffset;
    }
    print('page = $_page map = $_pageMap');

  }

  _caculatePages(double paintHeight,Size size,String string){
    TextPosition position = _painter.getPositionForOffset(Offset(size.width, size.height));
    print('position = ${position.offset}');
    while (_painter.size.height > size.height) {

      _totalOffset += position.offset;
      
      String remainString = string.substring(position.offset);

      _painter = _textPainter(remainString);
      _painter.layout(maxWidth: size.width,minWidth: 0);

      if (page == 0){
        _pageMap[_page+1] = string.substring(0,position.offset);
      } else {
        _pageMap[_page+1] = remainString;
      }
      _page ++;
      
      

      _caculatePages(paintHeight, size, remainString);
    }
  }

  _repaint(Canvas canvas,Size size,String string){
    _painter = _textPainter(string);
    _painter.layout(maxWidth: size.width,minWidth: 0);
    // _painter.paint(canvas, Offset(0, 0));
  }

  TextPainter _textPainter(String content){
    return TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: content??'',
            style: TextStyle(color: Colors.black, fontSize: 14),
            )
          );
  }

  bool _isExceed(double paintHeight,double sizeHeight){
    if (paintHeight > sizeHeight) {
      return true;
    }
    return false;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}