import 'package:flutter/material.dart';
import 'package:znovel_flutter/Shelf/BookShelf.dart';
import 'package:znovel_flutter/Classify/Classify.dart';
import 'package:znovel_flutter/Personal/Personal.dart';
import 'package:znovel_flutter/BookStore/BookStore.dart';

class BaseTabBarPage extends StatefulWidget {
  @override
  BaseTabBarState createState() => BaseTabBarState();
}

class BaseTabBarState extends State<BaseTabBarPage> {
  int _selectedIndex = 1;

  List<Widget> subPages = List<Widget>();

  @override
  void initState() {
    super.initState();

    initSDK();

    subPages
      ..add(BookStoreHomeWidget())
      ..add(BookShelfWidget())
      ..add(ClassifyWidget())
      ..add(PersonalWidget());
  }

  void initSDK(){
    
  }

  Text _getTabBarText(String title, [int index]) {
    return Text(title);
  }

  Image _getTabBarNomalImage(String normalImage) {
    return Image.asset(normalImage, width: 24, height: 24);
  }

  Image _getTabBarSelectedImage(String selectedImage) {
    return Image.asset(selectedImage, width: 24, height: 24);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: subPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _getTabBarNomalImage('book_images/Tab/home-normal.png'),
              activeIcon:
                  _getTabBarSelectedImage('book_images/Tab/home-selected.png'),
              title: _getTabBarText('书城',0)),
          BottomNavigationBarItem(
              icon: _getTabBarNomalImage('book_images/Tab/book-normal.png'),
              activeIcon:
                  _getTabBarSelectedImage('book_images/Tab/book-selected.png'),
              title: _getTabBarText('书架',1)),
          BottomNavigationBarItem(
              icon: _getTabBarNomalImage('book_images/Tab/fenlei-normal.png'),
              activeIcon: _getTabBarSelectedImage(
                  'book_images/Tab/fenlei-selected.png'),
              title: _getTabBarText('分类',2)),
          BottomNavigationBarItem(
              icon: _getTabBarNomalImage('book_images/Tab/profile-normal.png'),
              activeIcon: _getTabBarSelectedImage(
                  'book_images/Tab/profile-selected.png'),
              title: _getTabBarText('我的',3)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF6B2D),
        unselectedItemColor: const Color(0xFF949499),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: _onTappedBottom,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _onTappedBottom(int selectedItem) {
    setState(() {
      _selectedIndex = selectedItem;
    });
  }
}
