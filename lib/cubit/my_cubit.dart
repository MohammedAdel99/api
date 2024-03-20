import '../user_model.dart';
import 'package:api/my_repo.dart';
import 'package:api/network_exceptions.dart';
import 'package:api/cubit/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<ResultState<User>> {
  final MyRepo myRepo;
  MyCubit(
    this.myRepo,
  ) : super(Idle());
  //Todo: Get All Users
  // void emitGetAllUsers() async {
  //   var data = await myRepo.getAllUsers();
  //   data.when(success: (List<User> allUsers) {
  //     emit(ResultState.success(allUsers ));
  //   }, failure: (NetworkExceptions networkExceptions) {
  //     emit(ResultState.error(networkExceptions));
  //   });
  // }

  //Todo: Get user by Id
  // void emitGetUserById(int userId) async {
  //   var data = await myRepo.getUserById(userId);
  //   data.when(success: (User userData) {
  //     emit(ResultState.success(userData));
  //   }, failure: (NetworkExceptions networkExceptions) {
  //     emit(ResultState.error(networkExceptions));
  //   });
  // }

  //Todo: Create New User (post)
  void emitCreateNewUser(User newUser) async {
    var data = await myRepo.createNewUser(newUser);
    data.when(success: (User userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  //Todo: Delete User
  // void emitDeleteUser(int userId) async {
  //   var result = await myRepo.deleteUser(userId);
  //   result.when(success: (dynamic data) {
  //     emit(ResultState.success(data));
  //   }, failure: (NetworkExceptions networkException) {
  //     emit(ResultState.error(networkException));
  //   });
  // }
}
