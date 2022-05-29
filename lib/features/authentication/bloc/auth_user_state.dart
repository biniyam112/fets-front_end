import 'package:equatable/equatable.dart';
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

class UserAuthFailed extends AuthUserState {
  final String errorMessage;

  UserAuthFailed({required this.errorMessage});
}
