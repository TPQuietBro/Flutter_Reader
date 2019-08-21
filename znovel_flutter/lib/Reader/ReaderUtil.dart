import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReaderUtil{
  static double contentHeight(BuildContext context){
    return MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - kToolbarHeight;
  }

  static double screenWidth(BuildContext context){
    final size = MediaQuery.of(context).size;
    return size.width;
  }
}