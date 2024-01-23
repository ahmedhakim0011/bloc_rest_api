import 'package:bloc_api_practice/bloc/bloc/users_cubit.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<UsersCubit>().getUsers();

});
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users"),),
      body: BlocConsumer<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(user.firstName.toString()),
                    subtitle: Text(user.address!.city.toString()),
                    leading: Image.network(user.image.toString()),
                  ),
                );
              });
            }
            return const SizedBox();
          },
          listener: (context, state) {}),
    );
  }
}
