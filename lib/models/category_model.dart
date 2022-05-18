class CategoryModel {
  bool? status;
  String? msg;
  CategoryResult? result;

  CategoryModel({this.status, this.msg, this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new CategoryResult.fromJson(json['result']) : null;
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

class CategoryResult {
  List<Category>? category;

  CategoryResult({this.category});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
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