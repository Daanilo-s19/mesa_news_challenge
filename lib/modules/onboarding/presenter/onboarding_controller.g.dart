// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardingController on _OnboardingControllerBase, Store {
  final _$activeAtom = Atom(name: '_OnboardingControllerBase.active');

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  final _$heightAtom = Atom(name: '_OnboardingControllerBase.height');

  @override
  double get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(double value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  final _$animationTimerMsAtom =
      Atom(name: '_OnboardingControllerBase.animationTimerMs');

  @override
  int get animationTimerMs {
    _$animationTimerMsAtom.reportRead();
    return super.animationTimerMs;
  }

  @override
  set animationTimerMs(int value) {
    _$animationTimerMsAtom.reportWrite(value, super.animationTimerMs, () {
      super.animationTimerMs = value;
    });
  }

  final _$_OnboardingControllerBaseActionController =
      ActionController(name: '_OnboardingControllerBase');

  @override
  dynamic initAnimation() {
    final _$actionInfo = _$_OnboardingControllerBaseActionController
        .startAction(name: '_OnboardingControllerBase.initAnimation');
    try {
      return super.initAnimation();
    } finally {
      _$_OnboardingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
active: ${active},
height: ${height},
animationTimerMs: ${animationTimerMs}
    ''';
  }
}
