import 'package:equatable/equatable.dart';
import 'package:fets_mobile/features/authentication/model/api_auth_data.dart';

class AuthUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthIdle extends AuthUserState {}

class AuthenticatingUser extends AuthUserState {}

class UserAuthenticated extends AuthUserState {
  final String response;

  UserAuthenticated({required this.response});
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
