class UserModel {
  final int? id;
  final String? name;
  final String? gender;
  final String? status;
  final String? email;

  UserModel({this.id,this.name, this.gender, this.status, this.email});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        id: jsonData['id'],
        name: jsonData['name'],
        gender: jsonData['gender'],
        status: jsonData['status'],
        email: jsonData['email']);
  }
}