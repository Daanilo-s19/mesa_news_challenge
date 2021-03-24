// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SigninController on _SigninControllerBase, Store {
  final _$signinAtom = Atom(name: '_SigninControllerBase.signin');

  @override
  SigninModel get signin {
    _$signinAtom.reportRead();
    return super.signin;
  }

  @override
  set signin(SigninModel value) {
    _$signinAtom.reportWrite(value, super.signin, () {
      super.signin = value;
    });
  }

  final _$signinUserAsyncAction =
      AsyncAction('_SigninControllerBase.signinUser');

  @override
  Future signinUser() {
    return _$signinUserAsyncAction.run(() => super.signinUser());
  }

  final _$_SigninControllerBaseActionController =
      ActionController(name: '_SigninControllerBase');

  @override
  dynamic setSignin(SigninModel value) {
    final _$actionInfo = _$_SigninControllerBaseActionController.startAction(
        name: '_SigninControllerBase.setSignin');
    try {
      return super.setSignin(value);
    } finally {
      _$_SigninControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signin: ${signin}
    ''';
  }
}