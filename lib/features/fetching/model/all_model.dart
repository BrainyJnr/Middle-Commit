import 'package:cloud_firestore/cloud_firestore.dart';

class AllModel {
  String id;
  String image;
  double? price;
  String title;
  //bool? Foodtype;

  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  AllModel({
    required this.image,
    required this.id,
   // this.Foodtype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static AllModel empty() => AllModel(
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
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory AllModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return AllModel.empty();
    final data = document.data()!;
    return AllModel(
      id: document.id,
      title: data["Title"],
     // Foodtype: data["FoodType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory AllModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return AllModel(
      id: document.id,
      title: data["Title"] ?? "",
     // Foodtype: data["FoodType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
    );
  }
}
