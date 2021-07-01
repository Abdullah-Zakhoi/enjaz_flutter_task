
class UsersListModel {
  final List<dynamic>? usersList;
  UsersListModel({this.usersList});
  factory UsersListModel.fromJson(Map<String, dynamic> jsonData) {
    return UsersListModel(
      usersList: jsonData['data'],
    );
  }
}

