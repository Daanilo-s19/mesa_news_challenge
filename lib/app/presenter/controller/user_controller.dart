import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news_challenge/app/data/models/user_model.dart';
import 'package:mesa_news_challenge/services/shared_preferences_services.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  UserMesaModel user;

  _UserControllerBase() {
    getUserData();
  }

  getUserData() async {
    final result = await SharedPreferencesService()
        .getStringData(SharedPreferencesService.KEY_USER_DATA);
    if (result.isNotEmpty) {
      user = UserMesaModel.fromMap(json.decode(result));
    }
  }

  @action
  setUserData(UserMesaModel value) async {
    this.user = value;
    await SharedPreferencesService().saveStringData(
        json.encode(user.toMap()), SharedPreferencesService.KEY_USER_DATA);
  }

  @action
  logOutUser() async {
    this.user = null;
    await SharedPreferencesService()
        .resetStringData(SharedPreferencesService.KEY_USER_DATA);
    Modular.to.popAndPushNamed("/onboarding");
  }
}
