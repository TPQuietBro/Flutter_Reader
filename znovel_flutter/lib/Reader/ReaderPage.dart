import 'dart:ui';

import 'package:flutter/material.dart';


class ReaderPage{
  final String content;
  ReaderPage({@required this.content});
  int get page => _page;
  int _page = 0;
  int _totalOffset = 0;

  Map get pageMap => _pageMap;
  Map _pageMap = {};

  TextPainter _painter;

  Future getPages(Size size) async{
    print('content length = ${this.content.length}');
    _painter = _textPainter(this.content);
    _painter.layout(maxWidth: size.width,minWidth: 0);
    double paintHeight = _painter.size.height;
    int contentHeight = this.content.length;

    print('paint height = ${_painter.size.height} , contentHeight : ${size.height}');

    _caculatePages(paintHeight, size, content);
    
    if (contentHeight - _totalOffset > 0) {
      _page ++;
      _pageMap[_page] = this.content.substring(_totalOffset);
    }
    // print('page = $_page map = $_pageMap');
  }

  _caculatePages(double paintHeight,Size size,String string){
    TextPosition position = _painter.getPositionForOffset(Offset(size.width, size.height));
    print('offset = ${position.offset}');
    while (_painter.size.height > size.height) {

      _totalOffset += position.offset;
      
      String remainString = string.substring(position.offset);

      _painter = _textPainter(remainString);
      _painter.layout(maxWidth: size.width,minWidth: 0);

      if (page == 0){
        String first = string.substring(0,position.offset);
        _pageMap[_page+1] = first;
      } else {
        _pageMap[_page+1] = remainString;
      }
      _page ++;
      
      _caculatePages(paintHeight, size, remainString);
    }
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
}