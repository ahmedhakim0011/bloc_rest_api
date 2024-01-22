import 'package:bloc_api_practice/bloc/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read()<UsersCubit>().getUsers();

});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersDetailsLoading) {
              return const CircularProgressIndicator();
            }
            if (state is UsersDetailsError) {
              final error = state.error;
              return Center(
                child: Text(error),
              );
            }
            if (state is UsersDetailsLoaded) {
              return ListView.builder(itemBuilder: (context, index) {
                final user = state.usersModel.users![index];
                return ListTile(
                  title: Text(user.firstName.toString()),
                );
              });
            }
            return SizedBox();
          },
          listener: (context, state) {}),
    );
  }
}
