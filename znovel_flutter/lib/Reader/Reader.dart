import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:znovel_flutter/Reader/ReaderPage.dart';
import 'package:znovel_flutter/Reader/ReaderPainter.dart';
import 'package:znovel_flutter/Reader/ReaderUtil.dart';

class ReaderWidget extends StatefulWidget {
  final String title;
  final int bookId;
  ReaderWidget({@required this.title, this.bookId});
  @override
  ReaderWidgetState createState() => ReaderWidgetState();
}

class ReaderWidgetState extends State<ReaderWidget> {
  String _content = '';
  List _chapters = [
    'Sources/1.txt',
    'Sources/2.txt',
    'Sources/3.txt',
    'Sources/4.txt',
    'Sources/5.txt',
    'Sources/6.txt',
    'Sources/7.txt',
    'Sources/8.txt',
  ];

  PageController _controller;
  int _chapter = 0;
  int _page = 0;
  ReaderPage _painter;

  @override
  initState(){
    super.initState();
    _controller = PageController(initialPage: _page, keepPage: true);
    _controller.addListener(() {
      _page = _controller.page.toInt();
      // Future.wait();
    });
    _initPainter();
  }

  Future _initPainter() async{
    await _getChapterContent(_chapter + 1);
    ReaderPage painter = ReaderPage(content: _content);
    await painter.getPages(Size(ReaderUtil.screenWidth(context),ReaderUtil.contentHeight(context)));
    setState(() {
      _painter = painter;
    });
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  String _getPageInfo(int page){
    if (_painter == null) return '';
    String chapterInfo = _painter?.pageMap[page];

    return chapterInfo??0;
  }

  Future _getChapterContent(int chapter) async {
    String data =
        await rootBundle.loadString('Sources/$chapter.txt').catchError((error) {
      print(error);
    });
    _content = data;
  }

  Widget _item(int index) {
    final width = ReaderUtil.screenWidth(context);
    final height = ReaderUtil.contentHeight(context);
    return Container(
      padding: EdgeInsets.only(top: 10),
        alignment: Alignment.topLeft,
        child: CustomPaint(
          size: Size(width, height), 
          painter: ReaderPainter(content: _getPageInfo(index+1))
          )
        );
  }

  _lastPage() {
    if (_page == 0) {
      print('已是第一页');
      return;
    }
    _page--;
    _controller.animateToPage(_page,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  _nextPage() {
    if (_page == _chapters.length - 1) {
      print('已完结');
      return;
    }
    _page++;
    _controller.animateToPage(_page,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
                children: <Widget>[
                  PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _painter?.page,
                      controller: _controller,
                      itemBuilder: (BuildContext context, int index) {
                        return _item(index);
                      }),
                  GestureDetector(
                    onTap: () {
                      print('last page');
                      _lastPage();
                    },
                    child: Container(
                      width: 50,
                      color: Color.fromRGBO(1, 1, 1, 0),
                      padding: EdgeInsets.only(left: 0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('next page');
                      _nextPage();
                    },
                    child: Container(
                      width: 50,
                      color: Color.fromRGBO(1, 1, 1, 0),
                      margin: EdgeInsets.only(
                          left: ReaderUtil.screenWidth(context) - 50),
                    ),
                  ),
                ],
              ));
  }
}