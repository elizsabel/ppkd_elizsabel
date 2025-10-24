import 'dart:convert';

class CustomerModel {
  int? id;
  String name;
  String email;
  int phone;
  String city;
  int password;

  CustomerModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'city': city,
      'password': password,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as int,
      city: map['city'] as String,
      password: map['password'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
