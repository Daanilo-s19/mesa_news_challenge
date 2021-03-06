// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  UserMesaModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserMesaModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$setUserDataAsyncAction =
      AsyncAction('_UserControllerBase.setUserData');

  @override
  Future setUserData(UserMesaModel value) {
    return _$setUserDataAsyncAction.run(() => super.setUserData(value));
  }

  final _$logOutUserAsyncAction = AsyncAction('_UserControllerBase.logOutUser');

  @override
  Future logOutUser() {
    return _$logOutUserAsyncAction.run(() => super.logOutUser());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
