import '../../authentication.dart';

class AuthUserRepo {
  final AuthUserDP authUserDP;

  AuthUserRepo({required this.authUserDP});

  Future<User> signUp(User user) async {
    return await authUserDP.signUp(user.tojson());
  }
}
