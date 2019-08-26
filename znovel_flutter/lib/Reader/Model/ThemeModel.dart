import 'package:mobx/mobx.dart';

// Include generated file
part 'ThemeModel.g.dart';

// This is the class used by rest of your codebase
class ThemeModel = _ThemeModel with _$ThemeModel;

// The store-class
abstract class _ThemeModel with Store {

  @observable
  dynamic themeColor;
  @observable
  dynamic textColor;

  @action
  void setThemeColor(dynamic color) {
    themeColor = color;
  }
  @action
  void setTextColor(dynamic color) {
    textColor = color;
  }
}