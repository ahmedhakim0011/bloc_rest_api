import 'package:bloc/bloc.dart';
import 'package:bloc_api_practice/api_services/api_services.dart';
import 'package:bloc_api_practice/models/users_model.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  getUsers() {
    emit(UsersDetailsLoading());
    ApiServices.getUsers()
        .then((value) => emit(UsersDetailsLoaded(value!)))
        .onError(
            (error, stackTrace) => emit(UsersDetailsError(error.toString())));
  }
}
