import 'package:flutter/material.dart';
import 'package:znovel_flutter/Reader/Component/SpaceSpan.dart';
import 'package:znovel_flutter/Reader/Model/FontModel.dart';
import 'package:znovel_flutter/Reader/Model/ThemeModel.dart';
import 'package:znovel_flutter/Reader/PageCaculation/ReaderItem.dart';
import 'package:znovel_flutter/Reader/PageCaculation/ReaderPageConfigeratin.dart';

class ContentSpan extends StatelessWidget{
  final String content;
  final FontModel fontModel;
  final ThemeModel themeModel;
  final FontWeight fontWeight;
  final double height;

  ContentSpan({
    @required this.content,
    this.fontModel,
    this.themeModel,
    this.fontWeight,
    this.height
    });
    
  @override
  build(BuildContext context){
    return RichText(
      text: _textSpan(content),//_configTextSpan(),
    );
  }

  TextSpan _configTextSpan(){
    double py = 100.0;
    double px = 0.0;
    Size itemSize = Size(100, 100);
    PageConfigeration configeration = PageConfigeration(
      richTextSize: itemSize,
      postion: Offset(px, py)
    );
    ReaderItem item = ReaderItem();
    int end = item.getItemRenderRect(itemSize, this.content);
    String str1 = this.content.substring(0,end);
    TextSpan span1 = TextSpan(
      text: str1,
      style: _style()
    );
    SpaceSpan span2 = SpaceSpan(
      contentHeight: itemSize.height,
      contentWidth: itemSize.width,

    );
    String str2 = this.content.substring(end);
    TextSpan span3 = TextSpan(
      text: str2,
      style: _style()
    );

    TextSpan span = TextSpan(
      children: [
        span1,
        span2,
        span3
      ]
    );
    return span;
  }

  List _getItemOffsets(TextSpan span,TextPainter painter,Size size){
    List offsets = [];
    int textIndex = 0;
    for (TextSpan subSpan in span.children) {
      if (subSpan is SpaceSpan) {
        Offset offset = painter.getOffsetForCaret(
          TextPosition(offset: textIndex), 
          Rect.fromLTRB(0, 0, size.width, size.height)
          );
        offsets.add(offset);
      }
      textIndex += subSpan.toPlainText().length;
    }
    return offsets;
  }

  TextStyle _style(){
      return TextStyle(
        fontSize: this.fontModel.fontSize,
        color: this.themeModel.textColor,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );
    }

  TextSpan _textSpan(
    String content,
    {double fontSize = 14,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    double height = 1.5}){

    return TextSpan(
            text: content??'',
            style: TextStyle(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
              height: height,
            )
          );
  }

}