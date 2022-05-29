import 'dart:async';

import 'package:fets_mobile/features/authentication/bloc/auth_user_event.dart';
import 'package:fets_mobile/features/authentication/bloc/auth_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication.dart';

class AuthUser extends Bloc<AuthUserEvent, AuthUserState> {
  AuthUser(initialState, {required this.authUserRepo}) : super(initialState) {
    on<AuthUserEvent>(_authUser);
  }
  final AuthUserRepo authUserRepo;

  Future<void> _authUser(
      AuthUserEvent event, Emitter<AuthUserState> emit) async {
    emit(AuthenticatingUser());
    try {
      User user = await authUserRepo.signUp(event.user);
      emit(UserAuthenticated(user: user));
    } catch (e) {
      emit(UserAuthFailed(errorMessage: e.toString()));
    }
  }
}
