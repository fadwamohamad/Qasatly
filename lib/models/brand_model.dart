import 'package:qastly/models/pagination.dart';

class BrandModel {
  bool? status;
  String? msg;
  BrandResult? result;

  BrandModel({this.status, this.msg, this.result});

  BrandModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? BrandResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class BrandResult {
  List<Brands>? brand;
  Pagination? pagination;

  BrandResult({this.brand, this.pagination});

  BrandResult.fromJson(Map<String, dynamic> json) {
    if (json['brand'] != null) {
      brand = <Brands>[];
      json['brand'].forEach((v) {
        brand!.add(Brands.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.brand != null) {
      data['brand'] = this.brand!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Brands {
  int? id;
  String? name;
  String? image;
  String? link;
  String? order;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? imageUrl;

  Brands(
      {this.id,
        this.name,
        this.image,
        this.link,
        this.order,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.imageUrl});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    link = json['link'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['link'] = this.link;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
