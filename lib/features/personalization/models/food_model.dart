import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  String id;
  String image;
  double? price;
  String title;
  bool? Foodtype;
  //final bool? isAvailable; // Make sure this matches the type of your data


  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  FoodModel( {
   // this.isAvailable,
    required this.image,
    required this.id,
    this.Foodtype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static FoodModel empty() => FoodModel(
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
      "FoodType": Foodtype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory FoodModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return FoodModel.empty();
    final data = document.data()!;
    return FoodModel(
      id: document.id,
      title: data["Title"],
      Foodtype: data["FoodType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      //isAvailable: data['isAvailable'] == true,

    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory FoodModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return FoodModel(
      id: document.id,
      title: data["Title"],
   //   Foodtype: data["FoodType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      //isAvailable: data['isAvailable'] == true, // Adjusted this line

    );
  }

  factory FoodModel.fromData(Map<String, dynamic> data) {
    return FoodModel(
      title: data['Title'] ?? '',
      price: data['Price']?.toDouble() ?? 0.0, image: data["Image"], id: ""
      // Parse other fields
    );
  }
}
