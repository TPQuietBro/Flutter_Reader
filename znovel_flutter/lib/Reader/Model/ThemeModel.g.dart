// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ThemeModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$ThemeModel on _ThemeModel, Store {
  final _$themeColorAtom = Atom(name: '_ThemeModel.themeColor');

  @override
  dynamic get themeColor {
    _$themeColorAtom.context.enforceReadPolicy(_$themeColorAtom);
    _$themeColorAtom.reportObserved();
    return super.themeColor;
  }

  @override
  set themeColor(dynamic value) {
    _$themeColorAtom.context.conditionallyRunInAction(() {
      super.themeColor = value;
      _$themeColorAtom.reportChanged();
    }, _$themeColorAtom, name: '${_$themeColorAtom.name}_set');
  }

  final _$textColorAtom = Atom(name: '_ThemeModel.textColor');

  @override
  dynamic get textColor {
    _$textColorAtom.context.enforceReadPolicy(_$textColorAtom);
    _$textColorAtom.reportObserved();
    return super.textColor;
  }

  @override
  set textColor(dynamic value) {
    _$textColorAtom.context.conditionallyRunInAction(() {
      super.textColor = value;
      _$textColorAtom.reportChanged();
    }, _$textColorAtom, name: '${_$textColorAtom.name}_set');
  }

  final _$_ThemeModelActionController = ActionController(name: '_ThemeModel');

  @override
  void setThemeColor(dynamic color) {
    final _$actionInfo = _$_ThemeModelActionController.startAction();
    try {
      return super.setThemeColor(color);
    } finally {
      _$_ThemeModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextColor(dynamic color) {
    final _$actionInfo = _$_ThemeModelActionController.startAction();
    try {
      return super.setTextColor(color);
    } finally {
      _$_ThemeModelActionController.endAction(_$actionInfo);
    }
  }
}
