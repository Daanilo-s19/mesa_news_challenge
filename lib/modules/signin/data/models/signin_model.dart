import 'dart:convert';

import 'package:mesa_news_challenge/modules/signin/domain/entities/signin_entity.dart';

class SigninModel extends Signin {
  SigninModel({
    String email,
    String password,
  }) : super(email: email, password: password);

  SigninModel copyWith({
    String email,
    String password,
  }) {
    return SigninModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SigninModel.fromMap(Map<String, dynamic> map) {
    return SigninModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SigninModel.fromJson(String source) =>
      SigninModel.fromMap(json.decode(source));

  @override
  String toString() => 'SigninModel(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SigninModel &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
