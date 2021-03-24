import 'dart:convert';

import 'package:mesa_news_challenge/app/domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel(
    String name,
    String email,
    String token,
  ) : super(email: email, name: name, token: token);

  UserModel copyWith({
    String name,
    String email,
    String token,
  }) {
    return UserModel(
      name ?? this.name,
      email ?? this.email,
      token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'],
      map['email'],
      map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(name: $name, email: $email, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.token == token;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ token.hashCode;
}
