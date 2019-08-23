import 'package:flutter/material.dart';
import 'package:znovel_flutter/Reader/ReaderUtil.dart';

class ReaderItem {
  final String content;
  ReaderItem({this.content});
  TextPainter _painter;

  // 根据绘制大小,返回插入的item位置
  int getItemRenderRect(Size size){
    _painter = _textPainter(this.content);
    _painter.layout(maxWidth: size.width,minWidth: size.width);
    TextPosition position = _painter.getPositionForOffset(Offset(size.width, size.height));
    return position.offset;
  }

  TextPainter _textPainter(String content){
    return TextPainter(
      textDirection: TextDirection.ltr,
      text: ReaderUtil.textSpan(content)
    );
  }
}