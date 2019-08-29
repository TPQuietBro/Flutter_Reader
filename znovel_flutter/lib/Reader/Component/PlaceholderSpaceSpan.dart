import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SpaceSpan extends TextSpan {
  final contentWidth;
  final contentHeight;
  final bgColor;
  SpaceSpan({
    @required this.contentWidth,
    @required this.contentHeight,
    this.bgColor,
    GestureRecognizer recognizer,
  }) : super(
            style: TextStyle(
                color: Colors.transparent,
                backgroundColor: bgColor,
                letterSpacing: contentWidth,
                height: 1.0,
                fontSize: (contentHeight / 30.0 * 26.0)),
            text: '\u200B',
            recognizer: recognizer);
}
