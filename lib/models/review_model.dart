// import 'package:qastly/models/category_model.dart';
// import 'package:qastly/models/product_model.dart';
//
// class ReviewModel {
//   bool? status;
//   String? msg;
//   ReviewResult? result;
//
//   ReviewModel({this.status, this.msg, this.result});
//
//   ReviewModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     msg = json['msg'];
//     result =
//     json['result'] != null ?  ReviewResult.fromJson(json['result']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['status'] = this.status;
//     data['msg'] = this.msg;
//     if (this.result != null) {
//       data['result'] = this.result!.toJson();
//     }
//     return data;
//   }
// }
//
// class ReviewResult {
//   int? id;
//   String? title;
//   int? price;
//   int? isAvailable;
//   String? description;
//   Category? category;
//   String? brand;
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
//   ReviewResult(
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
//   ReviewResult.fromJson(Map<String, dynamic> json) {
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
//
//
class Reviews {
  int? id;
  String? userName;
  String? imageUrl;
  int? customerId;
  int? productId;
  String? review;
  int? rating;

  Reviews(
      {this.id,
        this.userName,
        this.imageUrl,
        this.customerId,
        this.productId,
        this.review,
        this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    imageUrl = json['image_url'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    review = json['review'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['image_url'] = this.imageUrl;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['review'] = this.review;
    data['rating'] = this.rating;
    return data;
  }
}