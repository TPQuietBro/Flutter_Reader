import 'package:flutter/cupertino.dart';

class CyclePageView extends StatefulWidget {
  final int itemCount;
  final Axis scrollDirection;
  CyclePageView({this.itemCount,this.scrollDirection});
  @override
  CyclePageViewState createState() => CyclePageViewState();
}

class CyclePageViewState extends State<CyclePageView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: widget.scrollDirection,
      itemCount: widget.itemCount,
      itemBuilder: (BuildContext context,int index){
        return Container();
      },
    );
  }
}
