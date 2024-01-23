import 'package:bloc/bloc.dart';
import 'package:bloc_api_practice/api_services/api_services.dart';
import 'package:bloc_api_practice/models/login_model.dart';
import 'package:bloc_api_practice/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  callLogin(email , pass , BuildContext context) {
    emit(LoginLoadingState());
    ApiServices()
        .userLogin(email , pass)
        .then((value) {
          emit(LoginLoadedState(value!));
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Users()));

        })
        .onError(
            (error, stackTrace) {
              emit(LoginErrorState(error.toString()));
            });
  }
}
