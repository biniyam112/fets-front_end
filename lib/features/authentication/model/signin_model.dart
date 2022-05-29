class SigninModel {
  final String username;
  final String password;

  SigninModel({required this.password, required this.username});

  Map<String, dynamic> tojson() => {
        'username': username,
        'password': password,
      };
}
