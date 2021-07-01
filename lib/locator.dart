
import 'package:enjaz_flutter_task/services/users_service.dart';
import 'package:enjaz_flutter_task/view_models/list_of_users_view_model.dart';
import 'package:enjaz_flutter_task/view_models/log_in_view_model.dart';
import 'package:get_it/get_it.dart';

final locator =GetIt.instance;


void setup(){
  // log in feature
  locator.registerLazySingleton<UserApi>(() => UserApi());
  locator.registerLazySingleton<LogInViewModel>(() => LogInViewModel());

  // to get users' data
  // locator.registerLazySingleton<UsersListViewModelStore>(() => UsersListViewModelStore());
}
