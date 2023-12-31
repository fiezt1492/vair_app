import 'package:vair_app/models/Asset.dart';
import 'package:vair_app/models/Category.dart';
import 'package:vair_app/models/Developer.dart';
import 'package:vair_app/models/Publisher.dart';

class Product {
  int? id;
  String? name;
  String? description;
  num? price;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? downloadUrl;
  String? downloadCount;
  List<Asset>? banners;
  Asset? logo;
  List<Category>? categories;
  Developer? developer;
  Publisher? publisher;
  String? androidPackageName;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.downloadUrl,
      this.downloadCount,
      this.banners,
      this.logo,
      this.categories,
      this.developer,
      this.publisher,
      this.androidPackageName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    downloadUrl = json['downloadUrl'];
    downloadCount = json['downloadCount'];
    if (json['banners'] != null) {
      banners = <Asset>[];
      json['banners'].forEach((v) {
        banners!.add(Asset.fromJson(v));
      });
    }
    logo = json['logo'] != null ? Asset.fromJson(json['logo']) : null;
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
    developer = json['developer'] != null
        ? Developer.fromJson(json['developer'])
        : null;
    publisher = json['publisher'] != null
        ? Publisher.fromJson(json['publisher'])
        : null;
    androidPackageName = json['android_package_name'];
  }

  get error => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    data['downloadUrl'] = downloadUrl;
    data['downloadCount'] = downloadCount;
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (developer != null) {
      data['developer'] = developer!.toJson();
    }
    if (publisher != null) {
      data['publisher'] = publisher!.toJson();
    }
    data['android_package_name'] = androidPackageName;
    return data;
  }

  String get subtitle {
    var publisherName = publisher?.name ?? "Unknown Publisher";
    var developerName = developer?.name ?? "Unknown Developer";
    return "$publisherName, $developerName";
  }

  static fromJsonList(data) {}
}
