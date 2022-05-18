class User {
  int? id;
  String? email;
  String? phone;
  String? username;
  int? status;
  String? fcmToken;
  int? smsVerify;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? regoinId;
  String? cityId;
  String? idNumber;
  String? whappPhone;
  String? address;
  String? latitude;
  String? longitude;
  String? imageUrl;

  User(
      {this.id,
        this.email,
        this.phone,
        this.username,
        this.status,
        this.fcmToken,
        this.smsVerify,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.regoinId,
        this.cityId,
        this.idNumber,
        this.whappPhone,
        this.address,
        this.latitude,
        this.longitude,
        this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    status = json['status'];
    fcmToken = json['fcm_token'];
    smsVerify = json['sms_verify'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    regoinId = json['regoin_id'];
    cityId = json['city_id'];
    idNumber = json['id_number'];
    whappPhone = json['whapp_phone'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['status'] = this.status;
    data['fcm_token'] = this.fcmToken;
    data['sms_verify'] = this.smsVerify;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['regoin_id'] = this.regoinId;
    data['city_id'] = this.cityId;
    data['id_number'] = this.idNumber;
    data['whapp_phone'] = this.whappPhone;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['image_url'] = this.imageUrl;
    return data;
  }
}