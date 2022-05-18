import 'package:qastly/models/pagination.dart';

class AddressesModel {
  bool? status;
  String? msg;
  AddressesResult? result;

  AddressesModel({this.status, this.msg, this.result});

  AddressesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new AddressesResult.fromJson(json['result']) : null;
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

class AddressesResult {
  List<Address>? address;
  Pagination? pagination;

  AddressesResult({this.address, this.pagination});

  AddressesResult.fromJson(Map<String, dynamic> json) {
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(new Address.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Address {
  int? id;
  City? city;
  City? regoin;
  City? governorate;
  String? address;
  int? isDefault;
  String? fullAddress;
  String? name;

  Address(
      {this.id,
        this.city,
        this.regoin,
        this.governorate,
        this.address,
        this.isDefault,
        this.fullAddress,
        this.name});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    regoin = json['regoin'] != null ? new City.fromJson(json['regoin']) : null;
    governorate = json['governorate'] != null
        ? new City.fromJson(json['governorate'])
        : null;
    address = json['address'];
    isDefault = json['is_default'];
    fullAddress = json['full_address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.regoin != null) {
      data['regoin'] = this.regoin!.toJson();
    }
    if (this.governorate != null) {
      data['governorate'] = this.governorate!.toJson();
    }
    data['address'] = this.address;
    data['is_default'] = this.isDefault;
    data['full_address'] = this.fullAddress;
    data['name'] = this.name;
    return data;
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

