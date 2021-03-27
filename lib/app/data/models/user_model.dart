import 'dart:convert';

import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';

class UserMesaModel extends UserMesa {
  UserMesaModel({
    String name,
    String email,
    String token,
  }) : super(email: email, name: name, token: token);

  UserMesaModel copyWith({
    String name,
    String email,
    String token,
  }) {
    return UserMesaModel(
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory UserMesaModel.fromMap(Map<String, dynamic> map) {
    return UserMesaModel(
      name: map['name'],
      email: map['email'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMesaModel.fromJson(String source) =>
      UserMesaModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(name: $name, email: $email, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserMesaModel &&
        other.name == name &&
        other.email == email &&
        other.token == token;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ token.hashCode;
}
