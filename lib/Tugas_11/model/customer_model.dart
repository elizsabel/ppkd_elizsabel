import 'dart:convert';

class CustomerModel {
  int? id;
  String name;
  String email;
  String password;

  CustomerModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
