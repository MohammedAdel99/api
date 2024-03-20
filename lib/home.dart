import 'user_model.dart';
import 'package:flutter/material.dart';
import 'package:api/cubit/my_cubit.dart';
import 'package:api/network_exceptions.dart';
import 'package:api/cubit/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Todo: Get All Users
  List<User> usersList = [];
  //Todo: Get user by Id & Create new ser
  User user = User();
  @override
  void initState() {
    super.initState();
    //Todo: Get All Users
    //BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    //Todo: Get user by Id
    //BlocProvider.of<MyCubit>(context).emitGetUserById(6792071);
    //Todo: Create New User
    BlocProvider.of<MyCubit>(context).emitCreateNewUser(User(name: 'mohammed',email: 'moadelpro@gmail.com',gender: 'male',status: 'active'));
    //Todo: Delete User
    //BlocProvider.of<MyCubit>(context).emitDeleteUser(6794194);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<MyCubit, ResultState<User>>(
              builder: (context, ResultState<User> state) {
                return state.when(idle: () {
                  return const Center(child: CircularProgressIndicator());
                }, loading: () {
                  return const Center(child: CircularProgressIndicator());
                }, success: (User newUser) {
                   return Center(
                    child: Container(
                      color: Colors.yellow,

                      child: Text('Name : ${newUser.name}'),
                      
                    ),
                  );


                  // ListView.builder(
                  //     padding: const EdgeInsets.all(38),
                  //     shrinkWrap: true,
                  //     itemCount: usersList.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Column(
                  //         children: [
                  //           Container(
                  //             height: 40,
                  //             width: 300,
                  //             color: Colors.blue,
                  //             child: Text('Name : ${usersList[index].name}'),
                  //           ),
                  //           const SizedBox(height: 10)
                  //         ],
                  //       );
                  //     });
                }, error: (NetworkExceptions error) {
                  return Center(
                    child: Text(NetworkExceptions.getErrorMessage(error)),
                  );
                });
//Todo: Get All Users
                // if (state is GetAllUsers) {
                //   usersList = (state).allUsersList;
                //   return ListView.builder(
                //       padding: const EdgeInsets.all(38),
                //       shrinkWrap: true,
                //       itemCount: usersList.length,
                //       itemBuilder: (BuildContext context, int index) {
                //         return Column(
                //           children: [
                //             Container(
                //               height: 40,
                //               width: 300,
                //               color: Colors.blue,
                //               child: Text('Name : ${usersList[index].name}'),
                //             ),
                //             const SizedBox(height: 10),
                //           ],
                //         );
                //       });
                // } else {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
//Todo: Get User By Id
                // if (state is GetUserById) {
                //   user = (state).userDetials;
//Todo: Create New User (post)
                // if (state is CreateNewUser) {
                //   user = (state).newUser;
//Todo: Delete User
                // if (state is DeleteUser) {
                //   return Center(
                //     child: Container(
                //       color: Colors.yellow,
//Todo: Get User By Id & Todo: Create New User (post)
                //       // child: Text('Email : ${user.email}'),
                //       child: Text('Delete User Success ${(state).data}'),
                //     ),
                //   );
                // } else {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
              },
            )
          ],
        ),
      ),
    );
  }
}
