import 'package:flutter/material.dart';
import 'package:znovel_flutter/Classify/C.dart';

class ClassifyBWidget extends StatefulWidget {
  @override
  ClassifyBWidgetState createState() => ClassifyBWidgetState();
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}



class ClassifyBWidgetState extends State<ClassifyBWidget> {


@override
  void deactivate() {
    print('B deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return ClassifyCWidget();
            }));

            // showMenu(context: context,items: []);
            // showGeneralDialog(
            //   context: context,
            //   pageBuilder: (
            //     BuildContext context,
            //     Animation<double> animation1,
            //     Animation<double> animation2,
            //   ) {
            //     return Material(
            //       type: MaterialType.transparency,
            //       child: Container(
            //         child: Text('hello'),
            //       ),
            //     );
            //   },
            //   barrierDismissible: true,
            //   barrierLabel:
            //       MaterialLocalizations.of(context).popupMenuLabel,
            //   barrierColor: Colors.red,
            //   transitionDuration: const Duration(milliseconds: 4),
            //   transitionBuilder: _buildMaterialDialogTransitions,
            // );

            // showDialog();
            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return Material(
            //           type: MaterialType.transparency,
            //           child: Container(
            //             margin: EdgeInsets.only(top: 150,bottom: 150,right: 40,left: 40),
            //             color: Colors.red,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: <Widget>[
            //                 Text('确定要这样吗'),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: <Widget>[
            //                     FlatButton(
            //                       onPressed: () {
            //                         Navigator.of(context, rootNavigator: true)
            //                             .pop();
            //                       },
            //                       child: Text('cancel'),
            //                     ),
            //                     FlatButton(
            //                       onPressed: () {},
            //                       child: Text('ok'),
            //                     )
            //                   ],
            //                 )
            //               ],
            //             ),
            //           )
            //       );
            //     }
            //   );
          },
          child: Text('to C'),
        ),
      ),
    );
  }
}
