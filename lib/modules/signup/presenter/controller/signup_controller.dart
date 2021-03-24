import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/app/presenter/controller/app_controller.dart';
import 'package:mesa_news_challenge/enum/mesa_button_type.dart';
import 'package:mesa_news_challenge/modules/signup/data/models/signup_model.dart';
import 'package:mesa_news_challenge/modules/signup/domain/usecases/signup_user_usecase.dart';
import 'package:mesa_news_challenge/utils/mesa_utils.dart';
import 'package:mobx/mobx.dart';
part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  final AppController appController;

  final SignupUserUseCase signupUserUseCase;

  _SignupControllerBase(this.signupUserUseCase, this.appController);
  @observable
  SignupModel newUser = SignupModel();
  @observable
  MesaButtonType buttonType = MesaButtonType.DISABLED;
  @observable
  bool isFormError = false;

  @action
  setNewUser(SignupModel value) {
    newUser = value;
    isFormError = false;

    if (!errorName && !errorEmail && !errorPassword && !errorConfirmPassword) {
      buttonType = MesaButtonType.PRIMARY;
    } else {
      buttonType = MesaButtonType.DISABLED;
    }
  }

  @action
  signupUser() async {
    if (buttonType != MesaButtonType.DISABLED) {
      buttonType = MesaButtonType.LOADING;

      final result = await signupUserUseCase(newUser);
      result.fold((error) {
        MesaUtils.showLongToast(error.message);
        buttonType = MesaButtonType.PRIMARY;
      }, (user) {
        appController.userController.setUserData(user);
        Modular.to.popAndPushNamed("/home");
      });
    } else {
      isFormError = true;
    }
  }

  bool get errorName => newUser.name.isEmpty;
  bool get errorEmail => !MesaUtils.isValidEmail(newUser.email);
  bool get errorPassword => newUser.password.length < 6;
  bool get errorConfirmPassword => newUser.confirmPassword != newUser.password;
}
