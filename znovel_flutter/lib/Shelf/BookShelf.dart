import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:znovel_flutter/Reader/Reader.dart';

class BookShelfWidget extends StatefulWidget {
  @override
  BookShelfWidgetState createState() => BookShelfWidgetState();
}

class BookShelfWidgetState extends State<BookShelfWidget> {
  List dataSource = ['诛仙','诛仙','诛仙','诛仙','诛仙','诛仙','诛仙','诛仙','诛仙',];

  _pushToReader(int index){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return ReaderWidget(title: dataSource[index].toString(),bookId: 111,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("书架"),
        ),
        body: Center(
          child: GridView(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
            ),
            padding: EdgeInsets.all(10),
            children: List.generate(20, (int index) {
              return GestureDetector(
                onTap: () {
                  _pushToReader(index);
                },
                child: Container(
                  color: Colors.red,
                  child: Text('诛仙'),
                  alignment: Alignment.center,
                ),
              );
            }),
          ),
        ));
  }
}
