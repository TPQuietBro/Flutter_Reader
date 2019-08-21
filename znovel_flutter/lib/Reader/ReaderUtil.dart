import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReaderUtil{
  static double contentHeight(BuildContext context){
    double topMargin = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = kToolbarHeight;
    double bottomMargin = MediaQuery.of(context).padding.bottom;
    return screenHeight - (topMargin + appBarHeight + bottomMargin + 100);
  }

  static double screenWidth(BuildContext context){
    final size = MediaQuery.of(context).size;
    return size.width;
  }
}