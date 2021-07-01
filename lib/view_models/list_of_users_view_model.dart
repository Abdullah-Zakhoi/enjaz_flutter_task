import 'package:enjaz_flutter_task/locator.dart';
import 'package:enjaz_flutter_task/models/user_model.dart';
import 'package:enjaz_flutter_task/services/users_service.dart';
import 'package:mobx/mobx.dart';

part 'list_of_users_view_model.g.dart';
class UsersListViewModelStore  = UsersListViewModel with _$UsersListViewModelStore;


abstract class UsersListViewModel with Store{


  @observable
  List<UserModel>? articlesList = [];

  @observable
  int pageNumber = 1;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchMoreUsers() async {
    print("he did this again");
    pageNumber = pageNumber  + 1;
    articlesList = await locator.get<UserApi>().fetchUsers(page: pageNumber);
    isLoading = false;
    print(articlesList!.length.toString());
  }

  @action
  Future<void> fetchUsers() async {
    print("he did this");
    articlesList = await locator.get<UserApi>().fetchUsers();
    print(articlesList!.length.toString());
  }

}