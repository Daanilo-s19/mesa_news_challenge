import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/app/presenter/controller/app_controller.dart';
import 'package:mesa_news_challenge/enum/mesa_button_type.dart';
import 'package:mesa_news_challenge/modules/signin/data/models/signin_model.dart';
import 'package:mesa_news_challenge/modules/signin/domain/usecases/signin_user_usecase.dart';
import 'package:mesa_news_challenge/modules/signin/domain/usecases/signin_with_facebook_usecase.dart';
import 'package:mesa_news_challenge/utils/mesa_utils.dart';
import 'package:mobx/mobx.dart';
part 'signin_controller.g.dart';

class SigninController = _SigninControllerBase with _$SigninController;

abstract class _SigninControllerBase with Store {
  final AppController appController;
  final SigninUserUseCase signinUserUseCase;
  final SigninWithFacebookUsecase signinWithFacebookUsecase;
  _SigninControllerBase(this.signinUserUseCase, this.appController,
      this.signinWithFacebookUsecase);

  @observable
  SigninModel user = SigninModel();
  MesaButtonType buttonType = MesaButtonType.DISABLED;
  @observable
  bool isFormError = false, loading = false, loadingFb = false;

  @action
  setUser(SigninModel value) {
    user = value;
    isFormError = false;
    loading = false;

    if (!errorEmail && !errorPassword) {
      buttonType = MesaButtonType.PRIMARY;
    } else {
      buttonType = MesaButtonType.DISABLED;
    }
  }

  @action
  signinUser() async {
    if (buttonType != MesaButtonType.DISABLED) {
      loading = true;
      final result = await signinUserUseCase(user);
      result.fold((error) {
        MesaUtils.showLongToast(error.message);
        loading = false;
      }, (success) {
        appController.userController.setUserData(success);
        Modular.to.popAndPushNamed("/home");
      });
    } else {
      isFormError = true;
    }
  }

  @action
  signinWithFacebook() async {
    loadingFb = true;

    final result = await signinWithFacebookUsecase();
    result.fold((error) {
      MesaUtils.showLongToast(error.message);
      loadingFb = false;
    }, (success) {
      appController.userController.setUserData(success);
      Modular.to.popAndPushNamed("/home");
    });
  }

  bool get errorEmail => !MesaUtils.isValidEmail(user.email);
  bool get errorPassword => user.password.length < 6;
}
