// import 'package:qastly/models/product_model.dart';
//
// class FavoritesModel {
//   bool? status;
//   String? msg;
//   FavResult? result;
//
//   FavoritesModel({this.status, this.msg, this.result});
//
//   FavoritesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     msg = json['msg'];
//     result =
//     json['result'] != null ? new FavResult.fromJson(json['result']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['msg'] = this.msg;
//     if (this.result != null) {
//       data['result'] = this.result!.toJson();
//     }
//     return data;
//   }
// }
//
// class FavResult {
//   List<Product>? product;
//   FavPagination? pagination;
//
//   FavResult({this.product, this.pagination});
//
//   FavResult.fromJson(Map<String, dynamic> json) {
//     if (json['product'] != null) {
//       product = <Product>[];
//       json['product'].forEach((v) {
//         product!.add(new Product.fromJson(v));
//       });
//     }
//     pagination = json['pagination'] != null
//         ? new FavPagination.fromJson(json['pagination'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.product != null) {
//       data['product'] = this.product!.map((v) => v.toJson()).toList();
//     }
//     if (this.pagination != null) {
//       data['pagination'] = this.pagination!.toJson();
//     }
//     return data;
//   }
// }
//
// class FavPagination {
//   int? iTotalObjects;
//   int? iItemsOnPage;
//   int? iPerPages;
//   int? iCurrentPage;
//   int? iTotalPages;
//
//   FavPagination(
//       {this.iTotalObjects,
//         this.iItemsOnPage,
//         this.iPerPages,
//         this.iCurrentPage,
//         this.iTotalPages});
//
//   FavPagination.fromJson(Map<String, dynamic> json) {
//     iTotalObjects = json['i_total_objects'];
//     iItemsOnPage = json['i_items_on_page'];
//     iPerPages = json['i_per_pages'];
//     iCurrentPage = json['i_current_page'];
//     iTotalPages = json['i_total_pages'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['i_total_objects'] = this.iTotalObjects;
//     data['i_items_on_page'] = this.iItemsOnPage;
//     data['i_per_pages'] = this.iPerPages;
//     data['i_current_page'] = this.iCurrentPage;
//     data['i_total_pages'] = this.iTotalPages;
//     return data;
//   }
// }