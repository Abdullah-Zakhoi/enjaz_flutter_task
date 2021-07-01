class LogInResponseModel {
  final String? token;


  LogInResponseModel(
      {this.token});

  factory LogInResponseModel.fromJson(Map<String, dynamic> json) {
    return LogInResponseModel(
      token: json['token'],
    );
  }
}
