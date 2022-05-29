import 'package:fets_mobile/features/authentication/model/api_data.dart';
import 'package:fets_mobile/features/authentication/model/signin_model.dart';

import '../../authentication.dart';

class AuthUserRepo {
  final AuthUserDP authUserDP;

  AuthUserRepo({required this.authUserDP});

  Future<User> signUp(User user) async {
    return await authUserDP.signUp(user.tojson());
  }

  Future<APIData> signIn(SigninModel signinModel) async {
    return await authUserDP.signIn(signinModel);
  }
}
