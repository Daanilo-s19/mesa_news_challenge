import 'dart:convert';

import 'package:mesa_news_challenge/app/data/models/user_model.dart';
import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';
import 'package:mesa_news_challenge/services/shared_preferences_services.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  UserModel user;

  _UserControllerBase() {
    getUserData();
  }

  getUserData() async {
    final result = await SharedPreferencesService()
        .getStringData(SharedPreferencesService.KEY_USER_DATA);
    if (result.isNotEmpty) {
      user = UserModel.fromMap(json.decode(result));
    }
  }

  @action
  setUserData(UserModel value) async {
    this.user = value;
    await SharedPreferencesService().saveStringData(
        json.encode(user.toMap()), SharedPreferencesService.KEY_USER_DATA);
  }

  @action
  logOutUser() async => await SharedPreferencesService()
      .resetStringData(SharedPreferencesService.KEY_USER_DATA);
}
