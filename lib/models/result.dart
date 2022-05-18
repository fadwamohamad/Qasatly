import 'package:qastly/models/user.dart';

class ResultLoginAndRegister{
  User? user;
  String? token;

  ResultLoginAndRegister({this.user, this.token});

  ResultLoginAndRegister.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}