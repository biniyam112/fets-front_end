import 'dart:async';
import 'dart:convert';

import 'package:fets_mobile/features/authentication/bloc/auth_user_event.dart';
import 'package:fets_mobile/features/authentication/bloc/auth_user_state.dart';
import 'package:fets_mobile/features/authentication/model/api_auth_data.dart';
import 'package:fets_mobile/features/authentication/model/api_data.dart';
import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../authentication.dart';

class AuthUser extends Bloc<AuthEvent, AuthUserState> {
  final AuthUserRepo authUserRepo;

  AuthUser(initialState, {required this.authUserRepo}) : super(initialState) {
    on<AuthUserEvent>(_authUser);
    on<SignInEvent>(_signInUser);
  }

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

  Future<void> _signInUser(
      SignInEvent event, Emitter<AuthUserState> emit) async {
    emit(AuthenticatingUser());

    try {
      APIData apiData = await authUserRepo.signIn(event.signinModel);
      if (apiData.statusCode != 200 && apiData.error) {
        emit(UserAuthFailed(errorMessage: apiData.errors![0]));
      }

      APIAuthData apiAuthData = APIAuthData.fromjson(apiData.body!);

      Hive.box(apiAuthDataHiveName).add(apiAuthData);

      emit(UserSignedInSuccessfully(apiAuthData: apiAuthData));
    } catch (e) {
      emit(UserAuthFailed(errorMessage: e.toString()));
    }
  }
}