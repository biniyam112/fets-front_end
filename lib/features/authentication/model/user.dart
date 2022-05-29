class User {
  final String? fullName, password, email;
  final int? phoneNumber;

  User({
    this.fullName,
    required this.password,
    required this.email,
    this.phoneNumber,
  });
}
