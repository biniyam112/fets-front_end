import 'package:equatable/equatable.dart';
import 'package:fets_mobile/features/authentication/model/signin_model.dart';

import '../authentication.dart';

abstract class AuthEvent extends Equatable {}

class AuthUserEvent extends AuthEvent {
  final User user;

  AuthUserEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class SignInEvent extends AuthEvent {
  final SigninModel signinModel;

  SignInEvent({required this.signinModel});

  @override
  List<Object?> get props => [signinModel];
}
