import 'package:cloud_firestore/cloud_firestore.dart';

class DrinkModel {
  String id;
  String image;
  double? price;
  String title;
  bool? Drinktype;

  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  DrinkModel({
    required this.image,
    required this.id,
    this.Drinktype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static DrinkModel empty() => DrinkModel(
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
      "DrinkType": Drinktype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory DrinkModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return DrinkModel.empty();
    final data = document.data()!;
    return DrinkModel(
      id: document.id,
      title: data["Title"],
      Drinktype: data["DrinkType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory DrinkModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return DrinkModel(
      id: document.id,
      title: data["Title"],
      Drinktype: data["DrinkType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
    );
  }
}
