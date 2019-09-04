import 'package:flutter/material.dart';
import 'package:znovel_flutter/Reader/Util/ReaderUtil.dart';

class ReaderItem {
  TextPainter _painter;

  // 根据绘制大小,返回插入的item位置
  int getItemRenderRect(Size size,String content){
    _painter = _textPainter(content);
    _painter.layout(maxWidth: size.width,minWidth: size.width);
    TextPosition position = _painter.getPositionForOffset(Offset(size.width, size.height));
    return position.offset;
  }

  TextPainter _textPainter(String content,[TextSpan textSpan]){
    return TextPainter(
      textDirection: TextDirection.ltr,
      text:  textSpan??ReaderUtil.textSpan(content)
    );
  }
}