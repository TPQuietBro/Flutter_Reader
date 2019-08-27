import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:znovel_flutter/Reader/Component/ReaderFontSelector.dart';
import 'package:znovel_flutter/Reader/Model/FontModel.dart';
import 'package:znovel_flutter/Reader/Model/ThemeModel.dart';
import 'package:znovel_flutter/Reader/PageCaculation/ReaderItem.dart';
import 'package:znovel_flutter/Reader/PageCaculation/ReaderPage.dart';
import 'package:znovel_flutter/Reader/Component/ReaderTheme.dart';
import 'package:znovel_flutter/Reader/Util/ReaderUtil.dart';

final themeModel = ThemeModel();
final fontModel = FontModel();
final _renderItem = ReaderItem();

class ReaderWidget extends StatefulWidget {
  final String title;
  final int bookId;
  ReaderWidget({@required this.title, this.bookId});
  @override
  ReaderWidgetState createState() => ReaderWidgetState();
}

class ReaderWidgetState extends State<ReaderWidget>
    with SingleTickerProviderStateMixin {
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
  ReaderTheme _readerTheme;
  ReaderFontSelector _fontSelector;

  @override
  initState() {
    super.initState();
    _controller = PageController(initialPage: _page, keepPage: true);
    fontModel.fontSize = 14;
    _readerTheme = ReaderTheme(
      themeModel: themeModel,
    );
    themeModel.setTextColor(Colors.black);
    _fontSelector = ReaderFontSelector(
      fontModel: fontModel,
      fontChaneCallBack: (){
        _initPainter();
        if (_page != _painter.pageMap.length-1){
          _controller.jumpToPage(_page);
          return;
        }
        _controller.jumpToPage(0);
      },
    );
    _initPainter();
  }

  Future _initPainter() async {
    await _getChapterContent(_chapter + 1);
    ReaderPage painter = ReaderPage(content: _content,fontSize: fontModel.fontSize);
    await painter.getPages(_paintSize());
    setState(() {
      _painter = painter;
    });
  }

  Size _paintSize() {
    return Size(ReaderUtil.screenWidth(context) - 20,
        ReaderUtil.contentHeight(context) - 20);
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  String _getPageInfo(int page) {
    if (_painter == null) return '';
    String chapterInfo = _painter?.pageMap[page];

    return chapterInfo ?? 0;
  }

  Future _getChapterContent(int chapter) async {
    String data =
        await rootBundle.loadString('Sources/$chapter.txt').catchError((error) {
      print(error);
    });
    _content = data.replaceAll('\n\n', '\n');
    // _content = _content.replaceAll('\n', '');
  }

  Widget _item(int index) {
    return GestureDetector(
      onTap: () {
        // print('showalert');
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                  color: Colors.red,
                  height: 200,
                  child: Column(
                    children: <Widget>[_readerTheme, _fontSelector],
                  ));
            });
      },
      child: Container(
          alignment: Alignment.topLeft,
          child: Container(
              // color: Colors.orange,
              margin: EdgeInsets.all(10),
              child: Observer(
                builder: (_) => RichText(
                  text: ReaderUtil.textSpan(_getPageInfo(index + 1),
                      fontSize: fontModel.fontSize,color: themeModel.textColor),  
                ),
              ))),
    );
  }

  _lastPage(bool animation) {
    if (_page == 0) {
      print('已是第一页');
      return;
    }
    setState(() {
      _page--;
    });
    if (animation){
      _controller.animateToPage(_page,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      _controller.jumpToPage(_page);
    }
    
  }

  _nextPage(bool animation) {
    if (_page == _painter.page - 1) {
      print('已完结');
      return;
    }
    setState(() {
      _page++;
    });

    if (animation){
      _controller.animateToPage(_page,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      _controller.jumpToPage(_page);
    }
  }

  // 去除右滑返回手势
  Future<bool> _willPop() {
    Navigator.of(context).pop();
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _willPop,
        child: Observer(
          builder: (_) => Scaffold(
            backgroundColor: themeModel.themeColor ?? Colors.white,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Stack(
              children: <Widget>[
                NotificationListener(
                    onNotification: (ScrollEndNotification notification) {
                      int page = _controller.page.toInt();
                      if (page != _page) {
                        setState(() {
                          _page = page;
                        });
                      }
                      return true;
                    },
                    child: Listener(
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _painter?.page,
                          controller: _controller,
                          itemBuilder: (BuildContext context, int index) {
                            return _item(index);
                          }),
                    )),
                GestureDetector(
                  onTap: () {
                    print('last page');
                    _lastPage(false);
                  },
                  onHorizontalDragStart: (DragStartDetails details) {
                    if (details.localPosition.dx > 0) {
                      _lastPage(true);
                    }
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
                    _nextPage(false);
                  },
                  onHorizontalDragStart: (DragStartDetails details) {
                    if (details.localPosition.dx > 0) {
                      _nextPage(true);
                    }
                  },
                  child: Container(
                    width: 50,
                    color: Color.fromRGBO(1, 1, 1, 0),
                    margin: EdgeInsets.only(
                        left: ReaderUtil.screenWidth(context) - 50),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text('${_page + 1}/${_painter?.page}'),
                )
              ],
            ),
          ),
        ));
  }
}
