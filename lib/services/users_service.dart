import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:enjaz_flutter_task/models/log_in_response_model.dart';
import 'package:enjaz_flutter_task/models/user_model.dart';
import 'package:enjaz_flutter_task/models/users_list_model.dart';

class UserApi {
  late Response response;
  var dio = Dio();

  Future<LogInResponseModel?> fetchLogInToken(
      String email, String password) async {
    try {
      response = await dio.post('https://reqres.in/api/login', data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        LogInResponseModel tokenResponse =
            LogInResponseModel.fromJson(response.data);
        return tokenResponse;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<UserModel>?> fetchUsers({int page = 1}) async {
    try {
      response = await dio.get('https://gorest.co.in/public-api/users?page=$page');
      if (response.statusCode == 200) {
        print(response.data);
        UsersListModel users = UsersListModel.fromJson(response.data);
        List<UserModel> usersList =
            users.usersList!.map((e) => UserModel.fromJson(e)).toList();

        print("usersList.length");
        print(usersList.length);

        return usersList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
}
