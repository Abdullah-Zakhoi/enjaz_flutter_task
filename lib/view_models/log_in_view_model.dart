
import 'package:enjaz_flutter_task/locator.dart';
import 'package:enjaz_flutter_task/services/users_service.dart';
import 'package:enjaz_flutter_task/view_models/list_of_users_view_model.dart';
import 'package:enjaz_flutter_task/views/users_list_page.dart';
import 'package:flutter/material.dart';

class LogInViewModel {


  Future<void> fetchLogInToken({email , password , context})async {
    var s2 = await locator.get<UserApi>().fetchLogInToken(email, password);
    print(">>>>>>>>>>");
    print(s2!.token.toString());

    // await locator.get<UsersListViewModelStore>().fetchUsers();

    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new UsersListPage()));
  }
}