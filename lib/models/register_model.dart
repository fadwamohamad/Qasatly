import 'package:qastly/models/result.dart';
import 'package:qastly/models/user.dart';

class RegisterModel {
  bool? status;
  String? msg;
  ResultLoginAndRegister? result;

  RegisterModel({this.status, this.msg, this.result});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new ResultLoginAndRegister.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}


