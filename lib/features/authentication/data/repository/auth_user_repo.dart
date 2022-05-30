import '../../authentication.dart';

class AuthUserRepo {
  final AuthUserDP authUserDP;

  AuthUserRepo({required this.authUserDP});

  Future<String> signUp(User user) async {
    return await authUserDP.signUp(user.tojson());
  }

  Future<APIData> signIn(SigninModel signinModel) async {
    return await authUserDP.signIn(signinModel);
  }
}
