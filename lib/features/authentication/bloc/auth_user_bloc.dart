import 'dart:async';
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
