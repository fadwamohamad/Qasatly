import 'package:qastly/models/brand_model.dart';
import 'package:qastly/models/category_model.dart';
class HomeModel {
  bool? status;
  String? msg;
  HomeResult? result;

  HomeModel({this.status, this.msg, this.result});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? HomeResult.fromJson(json['result']) : null;
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

class HomeResult {
  List<Sliders>? sliders;
  List<Categories>? categories;
  List<Brands>? brands;
  List<CategoryProducts>? categoryProducts;

  HomeResult({this.sliders, this.categories, this.brands, this.categoryProducts});

  HomeResult.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(Sliders.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
    if (json['category_products'] != null) {
      categoryProducts = <CategoryProducts>[];
      json['category_products'].forEach((v) {
        categoryProducts!.add(CategoryProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.sliders != null) {
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands;
    }
    if (this.categoryProducts != null) {
      data['category_products'] =
          this.categoryProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sliders {
  int? id;
  String? image;
  String? link;
  String? description;
  int? order;
  int? isMain;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? productOrCategoryId;
  String? imageUrl;
  String? sliderUrl;
  Category? category;

  Sliders(
      {this.id,
        this.image,
        this.link,
        this.description,
        this.order,
        this.isMain,
        this.createdAt,
        this.updatedAt,
        this.type,
        this.productOrCategoryId,
        this.imageUrl,
        this.sliderUrl,
        this.category});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    link = json['link'];
    description = json['description'];
    order = json['order'];
    isMain = json['is_main'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    productOrCategoryId = json['product_or_category_id'];
    imageUrl = json['image_url'];
    sliderUrl = json['slider_url'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['link'] = this.link;
    data['description'] = this.description;
    data['order'] = this.order;
    data['is_main'] = this.isMain;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['product_or_category_id'] = this.productOrCategoryId;
    data['image_url'] = this.imageUrl;
    data['slider_url'] = this.sliderUrl;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Categories {
  int? id;
  int? parentId;
  String? name;
  String? imageUrl;
  String? bannerUrl;
  int? hasChildren;

  Categories(
      {this.id,
        this.parentId,
        this.name,
        this.imageUrl,
        this.bannerUrl,
        this.hasChildren});

  Categories.fromJson(Map<String, dynamic> json) {
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

class CategoryProducts {
  String? id;
  String? name;
  List<CategoriesProductProducts>? products;
  Banner? banner;

  CategoryProducts({this.id, this.name, this.products, this.banner});

  CategoryProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    if (json['products'] != null) {
      products = <CategoriesProductProducts>[];
      json['products'].forEach((v) {
        products!.add(new CategoriesProductProducts.fromJson(v));
      });
    }
    banner =
    json['banner'] != null ? new Banner.fromJson(json['banner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
    }
    return data;
  }
}

class CategoriesProductProducts {
  int? id;
  String? title;
  int? price;
  int? isAvailable;
  String? description;
  int? isNew;
  bool? isOffer;
  int? newPrice;
  int? offerDiscountRate;
  String? imageUrl;
  bool? isFavorite;
  bool? rated;

  CategoriesProductProducts(
      {this.id,
        this.title,
        this.price,
        this.isAvailable,
        this.description,
        this.isNew,
        this.isOffer,
        this.newPrice,
        this.offerDiscountRate,
        this.imageUrl,
        this.isFavorite,
        this.rated});

  CategoriesProductProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    isAvailable = json['is_available'];
    description = json['description'];
    isNew = json['is_new'];
    isOffer = json['is_offer'];
    newPrice = json['new_price'];
    offerDiscountRate = json['offer_discount_rate'];
    imageUrl = json['image_url'];
    isFavorite = json['is_favorite'];
    rated = json['rated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['is_available'] = this.isAvailable;
    data['description'] = this.description;
    data['is_new'] = this.isNew;
    data['is_offer'] = this.isOffer;
    data['new_price'] = this.newPrice;
    data['offer_discount_rate'] = this.offerDiscountRate;
    data['image_url'] = this.imageUrl;
    data['is_favorite'] = this.isFavorite;
    data['rated'] = this.rated;
    return data;
  }
}

class Banner {
  int? id;
  String? title;
  int? isActive;
  String? image;
  String? type;
  String? link;
  String? iframe;
  String? pageType;
  String? createdAt;
  String? updatedAt;
  String? productOrCategoryId;
  String? place;
  int? placeOrder;
  String? imageUrl;
  Category? category;

  Banner(
      {this.id,
        this.title,
        this.isActive,
        this.image,
        this.type,
        this.link,
        this.iframe,
        this.pageType,
        this.createdAt,
        this.updatedAt,
        this.productOrCategoryId,
        this.place,
        this.placeOrder,
        this.imageUrl,
        this.category});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isActive = json['is_active'];
    image = json['image'];
    type = json['type'];
    link = json['link'];
    iframe = json['iframe'];
    pageType = json['page_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productOrCategoryId = json['product_or_category_id'];
    place = json['place'];
    placeOrder = json['place_order'];
    imageUrl = json['image_url'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['type'] = this.type;
    data['link'] = this.link;
    data['iframe'] = this.iframe;
    data['page_type'] = this.pageType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_or_category_id'] = this.productOrCategoryId;
    data['place'] = this.place;
    data['place_order'] = this.placeOrder;
    data['image_url'] = this.imageUrl;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}