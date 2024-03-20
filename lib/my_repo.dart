import 'user_model.dart';
import 'web_services.dart';
import 'package:api/api_result.dart';
import 'package:api/network_exceptions.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);

  //Todo: Get All Users
  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  //Todo: Get user by Id
  Future<ApiResult<User>> getUserById(int userId) async {
    try {
      var response = await webServices.getUserById(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  //Todo: Create New User (post)
  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      var response = await webServices.createNewUser(newUser);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  //Todo: Delete User
  Future<ApiResult<dynamic>> deleteUser(int userId) async {
    try {
      var response = await webServices.deleteUser(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
