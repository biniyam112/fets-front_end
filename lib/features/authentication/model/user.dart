import 'package:hive/hive.dart';

class User {
  final String? id, fullName, password, email, token, address;
  final int? phoneNumber;

  User({
    this.id,
    this.email,
    this.token,
    this.address,
    this.fullName,
    this.password,
    this.phoneNumber,
  });

  factory User.copywith(User user) => User(
        id: user.id,
        email: user.email,
        fullName: user.fullName,
        phoneNumber: user.phoneNumber,
        token: user.token,
        address: user.address,
      );

  Map<String, dynamic> tojson() => {
        'id': id,
        'name': fullName,
        'email': email,
        'password': password,
        'phone': phoneNumber,
        'token': token,
        'username': '',
        'address': address,
      };
  factory User.fromjson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullName: json['name'],
        email: json['email'],
        phoneNumber: json['phone'],
        address: json['address'],
      );
}
