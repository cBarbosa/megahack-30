// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerLogin on ControllerLoginBase, Store {
  final _$userAtom = Atom(name: 'ControllerLoginBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isLogggingAtom = Atom(name: 'ControllerLoginBase.isLoggging');

  @override
  bool get isLoggging {
    _$isLogggingAtom.reportRead();
    return super.isLoggging;
  }

  @override
  set isLoggging(bool value) {
    _$isLogggingAtom.reportWrite(value, super.isLoggging, () {
      super.isLoggging = value;
    });
  }

  final _$saveUserAsyncAction = AsyncAction('ControllerLoginBase.saveUser');

  @override
  Future saveUser() {
    return _$saveUserAsyncAction.run(() => super.saveUser());
  }

  final _$getUserAsyncAction = AsyncAction('ControllerLoginBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$ControllerLoginBaseActionController =
      ActionController(name: 'ControllerLoginBase');

  @override
  dynamic logout() {
    final _$actionInfo = _$ControllerLoginBaseActionController.startAction(
        name: 'ControllerLoginBase.logout');
    try {
      return super.logout();
    } finally {
      _$ControllerLoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggging: ${isLoggging}
    ''';
  }
}
