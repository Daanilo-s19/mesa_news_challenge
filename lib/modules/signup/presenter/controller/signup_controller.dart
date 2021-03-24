import 'package:mesa_news_challenge/modules/signup/data/models/signup_model.dart';
import 'package:mesa_news_challenge/modules/signup/domain/usecases/signup_user_usecase.dart';
import 'package:mobx/mobx.dart';
part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  final SignupUserUseCase signupUserUseCase;

  @observable
  SignupModel newUser = SignupModel();

  _SignupControllerBase(this.signupUserUseCase);

  @action
  setNewUser(SignupModel value) => newUser = value;

  @action
  signupUser() async {
    print("loading...");
    final result = await signupUserUseCase(newUser);
    result.fold((l) => print(l), (r) => print(r));
  }
}
