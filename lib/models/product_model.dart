// import 'package:qastly/models/review_model.dart';
//
// class AllProductsModel {
//   bool? status;
//   String? msg;
//   Result? result;
//
//   AllProductsModel({this.status, this.msg, this.result});
//
//   AllProductsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     msg = json['msg'];
//     result =
//     json['result'] != null ? new Result.fromJson(json['result']) : null;
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
// class Result {
//   Product? product;
//
//   Result({this.product});
//
//   Result.fromJson(Map<String, dynamic> json) {
//     product =
//     json['product'] != null ? new Product.fromJson(json['product']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.product != null) {
//       data['product'] = this.product!.toJson();
//     }
//     return data;
//   }
// }
//
// class Product {
//   int? id;
//   String? title;
//   int? price;
//   int? isAvailable;
//   String? description;
//   Category? category;
//   Null? brand;
//   int? isNew;
//   String? createdAt;
//   String? updatedAt;
//   bool? isAvailableForInstallment;
//   int? newPrice;
//   int? offerDiscountRate;
//   String? imageUrl;
//   List<Null>? productImages;
//   bool? isFavorite;
//   bool? rated;
//   int? reviewsUserCount;
//   int? reviewsRate;
//   List<Reviews>? reviews;
//   List<ColorsOrSize>? colorsOrSize;
//
//   Product(
//       {this.id,
//         this.title,
//         this.price,
//         this.isAvailable,
//         this.description,
//         this.category,
//         this.brand,
//         this.isNew,
//         this.createdAt,
//         this.updatedAt,
//         this.isAvailableForInstallment,
//         this.newPrice,
//         this.offerDiscountRate,
//         this.imageUrl,
//         this.productImages,
//         this.isFavorite,
//         this.rated,
//         this.reviewsUserCount,
//         this.reviewsRate,
//         this.reviews,
//         this.colorsOrSize});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     isAvailable = json['is_available'];
//     description = json['description'];
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//     brand = json['brand'];
//     isNew = json['is_new'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     isAvailableForInstallment = json['is_available_for_installment'];
//     newPrice = json['new_price'];
//     offerDiscountRate = json['offer_discount_rate'];
//     imageUrl = json['image_url'];
//     if (json['product_images'] != null) {
//       productImages = <Null>[];
//       json['product_images'].forEach((v) {
//         productImages!.add(new Null.fromJson(v));
//       });
//     }
//     isFavorite = json['is_favorite'];
//     rated = json['rated'];
//     reviewsUserCount = json['reviews_user_count'];
//     reviewsRate = json['reviews_rate'];
//     if (json['reviews'] != null) {
//       reviews = <Reviews>[];
//       json['reviews'].forEach((v) {
//         reviews!.add(new Reviews.fromJson(v));
//       });
//     }
//     if (json['colors_or_size'] != null) {
//       colorsOrSize = <ColorsOrSize>[];
//       json['colors_or_size'].forEach((v) {
//         colorsOrSize!.add(new ColorsOrSize.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['price'] = this.price;
//     data['is_available'] = this.isAvailable;
//     data['description'] = this.description;
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     data['brand'] = this.brand;
//     data['is_new'] = this.isNew;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['is_available_for_installment'] = this.isAvailableForInstallment;
//     data['new_price'] = this.newPrice;
//     data['offer_discount_rate'] = this.offerDiscountRate;
//     data['image_url'] = this.imageUrl;
//     if (this.productImages != null) {
//       data['product_images'] =
//           this.productImages!.map((v) => v.toJson()).toList();
//     }
//     data['is_favorite'] = this.isFavorite;
//     data['rated'] = this.rated;
//     data['reviews_user_count'] = this.reviewsUserCount;
//     data['reviews_rate'] = this.reviewsRate;
//     if (this.reviews != null) {
//       data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
//     }
//     if (this.colorsOrSize != null) {
//       data['colors_or_size'] =
//           this.colorsOrSize!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Category {
//   int? id;
//   int? parentId;
//   String? name;
//   String? imageUrl;
//   Null? bannerUrl;
//   int? hasChildren;
//
//   Category(
//       {this.id,
//         this.parentId,
//         this.name,
//         this.imageUrl,
//         this.bannerUrl,
//         this.hasChildren});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     parentId = json['parent_id'];
//     name = json['name'];
//     imageUrl = json['image_url'];
//     bannerUrl = json['banner_url'];
//     hasChildren = json['has_children'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['parent_id'] = this.parentId;
//     data['name'] = this.name;
//     data['image_url'] = this.imageUrl;
//     data['banner_url'] = this.bannerUrl;
//     data['has_children'] = this.hasChildren;
//     return data;
//   }
// }
//
// class ColorsOrSize {
//   int? id;
//   Null? color;
//   String? humanColor;
//   String? code;
//   List<Size>? size;
//
//   ColorsOrSize({this.id, this.color, this.humanColor, this.code, this.size});
//
//   ColorsOrSize.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     color = json['color'];
//     humanColor = json['human_color'];
//     code = json['code'];
//     if (json['size'] != null) {
//       size = <Size>[];
//       json['size'].forEach((v) {
//         size!.add(new Size.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['color'] = this.color;
//     data['human_color'] = this.humanColor;
//     data['code'] = this.code;
//     if (this.size != null) {
//       data['size'] = this.size!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Size {
//   int? variationId;
//   int? id;
//   String? size;
//   String? price;
//
//   Size({this.variationId, this.id, this.size, this.price});
//
//   Size.fromJson(Map<String, dynamic> json) {
//     variationId = json['variation_id'];
//     id = json['id'];
//     size = json['size'];
//     price = json['price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['variation_id'] = this.variationId;
//     data['id'] = this.id;
//     data['size'] = this.size;
//     data['price'] = this.price;
//     return data;
//   }
// }