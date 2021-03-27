import 'dart:async';

import 'package:mesa_news_challenge/modules/signin/presenter/controller/signin_controller.dart';
import 'package:mobx/mobx.dart';
part 'onboarding_controller.g.dart';

class OnboardingController = _OnboardingControllerBase
    with _$OnboardingController;

abstract class _OnboardingControllerBase with Store {
  final SigninController signinController;
  @observable
  bool active = false;
  @observable
  double height = 0;
  @observable
  int animationTimerMs = 300;

  _OnboardingControllerBase(this.signinController) {
    initAnimation();
  }

  @action
  initAnimation() {
    Timer(Duration(milliseconds: animationTimerMs), () {
      active = true;
      height = 247;
    });
  }
}
