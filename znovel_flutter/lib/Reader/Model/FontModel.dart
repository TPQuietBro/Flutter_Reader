import 'package:mobx/mobx.dart';

// Include generated file
part 'FontModel.g.dart';

// This is the class used by rest of your codebase
class FontModel = _FontModel with _$FontModel;

// The store-class
abstract class _FontModel with Store {

  @observable
  double fontSize;
  
  @action
  void setFontSize(double size) {
    fontSize = size;
  }
  
}