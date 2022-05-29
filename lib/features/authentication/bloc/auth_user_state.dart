import 'package:equatable/equatable.dart';
import 'package:fets_mobile/features/authentication/model/api_auth_data.dart';

import '../authentication.dart';

class AuthUserState extends Equatable {
  @override
  List<Object?> get props => [props];
}

class AuthIdle extends AuthUserState {}

class AuthenticatingUser extends AuthUserState {}

class UserAuthenticated extends AuthUserState {
  final User user;

  UserAuthenticated({required this.user});
}

class UserSignedInSuccessfully extends AuthUserState {
  final APIAuthData apiAuthData;

  UserSignedInSuccessfully({required this.apiAuthData});

  @override
  List<Object?> get props => [apiAuthData];
}

class UserAuthFailed extends AuthUserState {
  final String errorMessage;

  UserAuthFailed({required this.errorMessage});
}
