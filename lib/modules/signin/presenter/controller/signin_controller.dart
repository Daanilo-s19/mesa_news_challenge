import 'package:mesa_news_challenge/modules/signin/data/models/signin_model.dart';
import 'package:mesa_news_challenge/modules/signin/domain/usecases/signin_user_usecase.dart';
import 'package:mobx/mobx.dart';
part 'signin_controller.g.dart';

class SigninController = _SigninControllerBase with _$SigninController;

abstract class _SigninControllerBase with Store {
  final SigninUserUseCase signinUserUseCase;

  @observable
  SigninModel user = SigninModel();

  _SigninControllerBase(this.signinUserUseCase);

  @action
  setSignin(SigninModel value) => user = value;

  @action
  signinUser() async {
    print("loading...");
    final result = await signinUserUseCase(user);
    result.fold((l) => print(l), (r) => print(r));
  }
}
