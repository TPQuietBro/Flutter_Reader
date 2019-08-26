// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FontModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$FontModel on _FontModel, Store {
  final _$fontSizeAtom = Atom(name: '_FontModel.fontSize');

  @override
  double get fontSize {
    _$fontSizeAtom.context.enforceReadPolicy(_$fontSizeAtom);
    _$fontSizeAtom.reportObserved();
    return super.fontSize;
  }

  @override
  set fontSize(double value) {
    _$fontSizeAtom.context.conditionallyRunInAction(() {
      super.fontSize = value;
      _$fontSizeAtom.reportChanged();
    }, _$fontSizeAtom, name: '${_$fontSizeAtom.name}_set');
  }

  final _$_FontModelActionController = ActionController(name: '_FontModel');

  @override
  void setFontSize(double size) {
    final _$actionInfo = _$_FontModelActionController.startAction();
    try {
      return super.setFontSize(size);
    } finally {
      _$_FontModelActionController.endAction(_$actionInfo);
    }
  }
}
