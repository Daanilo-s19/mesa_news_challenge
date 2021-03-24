import 'dart:convert';
import 'package:mesa_news_challenge/modules/signup/domain/entities/signup_entity.dart';

class SignupModel extends Signup {
  SignupModel({
    String name,
    String email,
    String password,
  }) : super(name: name, email: email, password: password);

  SignupModel copyWith({
    String name,
    String email,
    String password,
  }) {
    return SignupModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupModel.fromJson(String source) =>
      SignupModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SignupModel(name: $name,email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignupModel &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;
}
