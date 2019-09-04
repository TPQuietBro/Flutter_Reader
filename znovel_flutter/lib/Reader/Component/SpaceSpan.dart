import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SpaceSpan extends TextSpan {
  final contentWidth;
  final contentHeight;
  SpaceSpan({
    @required this.contentWidth,
    @required this.contentHeight,
    GestureRecognizer recognizer,
  }) : super(
            style: TextStyle(
                color: Colors.transparent,
                letterSpacing: contentWidth,
                backgroundColor: Colors.red,
                height: 1.0,
                fontSize: (contentHeight / 30.0 * 26.0)),
            text: '\u200B',
            recognizer: recognizer);
}
