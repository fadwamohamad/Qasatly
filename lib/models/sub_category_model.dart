import 'package:qastly/models/pagination.dart';

class SubCategoryModel {
  bool? status;
  String? msg;
  SubCategoryResult? result;

  SubCategoryModel({this.status, this.msg, this.result});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new SubCategoryResult.fromJson(json['result']) : null;
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

class SubCategoryResult {
  List<Category>? category;
  Pagination? pagination;

  SubCategoryResult({this.category, this.pagination});

  SubCategoryResult.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  int? parentId;
  String? name;
  String? imageUrl;
  String? bannerUrl;
  int? hasChildren;

  Category(
      {this.id,
        this.parentId,
        this.name,
        this.imageUrl,
        this.bannerUrl,
        this.hasChildren});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    imageUrl = json['image_url'];
    bannerUrl = json['banner_url'];
    hasChildren = json['has_children'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['banner_url'] = this.bannerUrl;
    data['has_children'] = this.hasChildren;
    return data;
  }
}
