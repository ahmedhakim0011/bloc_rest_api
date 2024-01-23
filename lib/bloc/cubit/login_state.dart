part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginLoadedState extends LoginState {
  final LoginModel loginModel ;

  LoginLoadedState(this.loginModel);
}

final class LoginErrorState extends LoginState {
 final String error ;

  LoginErrorState(this.error);

}
