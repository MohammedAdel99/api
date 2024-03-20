import 'user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  //Todo: Get All Users
  @GET('users')
  Future<List<User>> getAllUsers();
  //Todo: Get user by Id
  @GET('users/{id}')
  Future<User> getUserById(@Path('id') int userId);
  //Todo: Create New User (post) 
  @POST('users')
  Future<User> createNewUser(@Body() User newUser,
  //@Header('Authorization') String token
  );
  //Todo: Delete User
  @DELETE('users/{id}')
  Future<dynamic> deleteUser(@Path('id') int userId );
  
}
