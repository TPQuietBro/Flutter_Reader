import 'package:flutter/material.dart';
import 'package:znovel_flutter/generated/i18n.dart';

class BookStoreHomeWidget extends StatefulWidget{
@override
BookStoreHomeWidgetState createState() => BookStoreHomeWidgetState();

}
class BookStoreHomeWidgetState extends State<BookStoreHomeWidget> with SingleTickerProviderStateMixin{
TabController _tabController;
List tabs = ['男频',' 女频','换一换','排行'];

@override
void initState(){
  super.initState();
  _tabController = TabController(length: tabs.length,vsync: this);
}

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        title: Text(I18n.of(context).BookStore),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e)=> Tab(text:e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e){
            return Container(
              alignment: Alignment.center,
              child: Text(e,textScaleFactor: 2),
            );
          }
        ).toList(),
      ),
  );
}
}