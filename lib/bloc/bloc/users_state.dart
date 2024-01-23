part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersDetailsLoading extends UsersState {}

final class UsersDetailsLoaded extends UsersState {
  final UsersModel usersModel;

  UsersDetailsLoaded(this.usersModel);
}

final class UsersDetailsError extends UsersState {
  final String error;
  UsersDetailsError(this.error);
}
