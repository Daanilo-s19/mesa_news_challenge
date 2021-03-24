// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupControllerBase, Store {
  final _$newUserAtom = Atom(name: '_SignupControllerBase.newUser');

  @override
  SignupModel get newUser {
    _$newUserAtom.reportRead();
    return super.newUser;
  }

  @override
  set newUser(SignupModel value) {
    _$newUserAtom.reportWrite(value, super.newUser, () {
      super.newUser = value;
    });
  }

  final _$buttonTypeAtom = Atom(name: '_SignupControllerBase.buttonType');

  @override
  MesaButtonType get buttonType {
    _$buttonTypeAtom.reportRead();
    return super.buttonType;
  }

  @override
  set buttonType(MesaButtonType value) {
    _$buttonTypeAtom.reportWrite(value, super.buttonType, () {
      super.buttonType = value;
    });
  }

  final _$isFormErrorAtom = Atom(name: '_SignupControllerBase.isFormError');

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

  final _$signupUserAsyncAction =
      AsyncAction('_SignupControllerBase.signupUser');

  @override
  Future signupUser() {
    return _$signupUserAsyncAction.run(() => super.signupUser());
  }

  final _$_SignupControllerBaseActionController =
      ActionController(name: '_SignupControllerBase');

  @override
  dynamic setNewUser(SignupModel value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setNewUser');
    try {
      return super.setNewUser(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newUser: ${newUser},
buttonType: ${buttonType},
isFormError: ${isFormError}
    ''';
  }
}
