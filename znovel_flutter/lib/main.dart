import 'package:znovel_flutter/Base/BaseTabBar.dart';
import 'package:flutter/material.dart';
import 'package:znovel_flutter/generated/i18n.dart';

void main() => runApp(ZNOVApp());

class ZNOVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;
    return MaterialApp(
      localizationsDelegates: [i18n],
      supportedLocales: i18n.supportedLocales,
      localeResolutionCallback: i18n.resolution(fallback: Locale("en", "US")),
      onGenerateTitle: (BuildContext context){
        return I18n.of(context).title;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseTabBarPage(),
    );
  }
}

