import 'dart:ui';
import 'package:flutter/material.dart';
class ReaderPage{
  // 章节内容
  final String content;
  ReaderPage({@required this.content});

  // 页数
  int get page => _page;
  int _page = 0;

  // 累加的偏移量
  int _totalOffset = 0;

  // 通过页码保存页面内容的map
  Map get pageMap => _pageMap;
  Map _pageMap = {};

  // 计算页面数量的TextPainter
  TextPainter _painter;

  Future getPages(Size size) async{
    print('content length = ${this.content.length}');
    _painter = _textPainter(this.content);
    _painter.layout(maxWidth: size.width,minWidth: 0);

    double paintHeight = _painter.size.height;
    int contentLength = this.content.length;

    print('paint height = ${_painter.size.height} , contentHeight : ${size.height}');

    _caculatePages(paintHeight, size, content);
    
    if (contentLength - _totalOffset > 0) {
      String lastContent = this.content.substring(_totalOffset);
      if (lastContent == '\n' || lastContent == ' ') {
        return;
      }
      _page ++;
      _pageMap[_page] = lastContent;
    }
    // print('page = $_page map = $_pageMap');
  }

  _caculatePages(double paintHeight,Size size,String string){
    // getPositionForOffset可以拿到在屏幕内的字符串偏移量,不超过绘制size的最大偏移量,也就是每一页的字数
    TextPosition position = _painter.getPositionForOffset(Offset(size.width, size.height));
    print('offset = ${position.offset}');
    while (_painter.size.height > size.height) {

      _totalOffset += position.offset;
      
      // remainString 表示剩下的字符串来计算page
      String remainString = string.substring(position.offset);

      // 这里直接保存每一页的内容
      String pageString = this.content.substring(_totalOffset-position.offset,_totalOffset);
      _pageMap[_page+1] = pageString;
      _page ++;

      // 重新布局,但不需要绘制,计算剩下内容真实布局高度
      _painter = _textPainter(remainString);
      _painter.layout(maxWidth: size.width,minWidth: 0);
      // 递归计算页面数量
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