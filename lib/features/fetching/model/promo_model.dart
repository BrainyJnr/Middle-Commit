import 'package:cloud_firestore/cloud_firestore.dart';

class PromoModel {
  String id;
  String image;
  double? price;
  String title;
  bool? promotype;

  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  PromoModel({
    required this.image,
    required this.id,
    this.promotype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static PromoModel empty() => PromoModel(
    image: "",
    id: "",
    title: "",
    price: 0,
  );

  /// Json Format
  toJson() {
    return {
      "Image": image,
      "Title": title,
      "PromoType": promotype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory PromoModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return PromoModel.empty();
    final data = document.data()!;
    return PromoModel(
      id: document.id,
      title: data["Title"],
      promotype: data["PromoType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory PromoModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return PromoModel(
      id: document.id,
      title: data["Title"],
      promotype: data["PromoType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
    );
  }
}
