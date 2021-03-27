// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SigninController on _SigninControllerBase, Store {
  final _$userAtom = Atom(name: '_SigninControllerBase.user');

  @override
  SigninModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(SigninModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isFormErrorAtom = Atom(name: '_SigninControllerBase.isFormError');

  @override
  bool get isFormError {
    _$isFormErrorAtom.reportRead();
    return super.isFormError;
  }

  @override
  set isFormError(bool value) {
    _$isFormErrorAtom.reportWrite(value, super.isFormError, () {
      super.isFormError = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SigninControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loadingFbAtom = Atom(name: '_SigninControllerBase.loadingFb');

  @override
  bool get loadingFb {
    _$loadingFbAtom.reportRead();
    return super.loadingFb;
  }

  @override
  set loadingFb(bool value) {
    _$loadingFbAtom.reportWrite(value, super.loadingFb, () {
      super.loadingFb = value;
    });
  }

  final _$signinUserAsyncAction =
      AsyncAction('_SigninControllerBase.signinUser');

  @override
  Future signinUser() {
    return _$signinUserAsyncAction.run(() => super.signinUser());
  }

  final _$signinWithFacebookAsyncAction =
      AsyncAction('_SigninControllerBase.signinWithFacebook');

  @override
  Future signinWithFacebook() {
    return _$signinWithFacebookAsyncAction
        .run(() => super.signinWithFacebook());
  }

  final _$_SigninControllerBaseActionController =
      ActionController(name: '_SigninControllerBase');

  @override
  dynamic setUser(SigninModel value) {
    final _$actionInfo = _$_SigninControllerBaseActionController.startAction(
        name: '_SigninControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_SigninControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isFormError: ${isFormError},
loading: ${loading},
loadingFb: ${loadingFb}
    ''';
  }
}
