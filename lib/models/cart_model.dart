// class CartModel {
//   bool? status;
//   String? msg;
//   Result? result;
//
//   CartModel({this.status, this.msg, this.result});
//
//   CartModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     msg = json['msg'];
//     result =
//     json['result'] != null ? Result.fromJson(json['result']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['status'] = this.status;
//     data['msg'] = this.msg;
//     if (this.result != null) {
//       data['result'] = this.result!.toJson();

//     return data;
//   }
// }
//
// class Result {
//   Total? total;
//   List<Null>? items;
//   int? cartCount;
//
//   Result({this.total, this.items, this.cartCount});
//
//   Result.fromJson(Map<String, dynamic> json) {
//     total = json['total'] != null ? new Total.fromJson(json['total']) : null;
//     if (json['items'] != null) {
//       items = <Null>[];
//       json['items'].forEach((v) {
//         items!.add(new Null.fromJson(v));
//       });
//     }
//     cartCount = json['cart_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.total != null) {
//       data['total'] = this.total!.toJson();
//     }
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     data['cart_count'] = this.cartCount;
//     return data;
//   }
// }
//
// class Total {
//   int? subTotal;
//   Null? coupon;
//   int? total;
//
//   Total({this.subTotal, this.coupon, this.total});
//
//   Total.fromJson(Map<String, dynamic> json) {
//     subTotal = json['sub_total'];
//     coupon = json['coupon'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['sub_total'] = this.subTotal;
//     data['coupon'] = this.coupon;
//     data['total'] = this.total;
//     return data;
//   }
// }