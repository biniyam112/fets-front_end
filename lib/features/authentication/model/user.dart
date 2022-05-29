import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? userName;
  @HiveField(2)
  final String? fullName;
  @HiveField(3)
  final String? password;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? token;
  @HiveField(6)
  final String? address;
  @HiveField(7)
  final String? phoneNumber;

  User({
    this.id,
    this.email,
    this.token,
    this.address,
    this.fullName,
    this.userName,
    this.password,
    this.phoneNumber,
  });

  User copywith({
    String? id,
    email,
    fullName,
    userName,
    password,
    phoneNumber,
    token,
    address,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        token: token ?? this.token,
        address: address ?? this.token,
      );

  Map<String, dynamic> tojson() => {
        // 'id': id,
        'name': fullName,
        'email': email,
        'username': userName,
        'password': password,
        'phone': phoneNumber,
        // 'token': token,
        // 'address': address,
      };
  factory User.fromjson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullName: json['name'],
        userName: json['username'],
        email: json['email'],
        phoneNumber: json['phone'],
        address: json['address'],
      );
}
