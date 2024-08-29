import 'package:cloud_firestore/cloud_firestore.dart';

class BreadModel {
  String id;
  String image;
  double? price;
  String title;
  final bool? isAvailable; // Make sure this matches the type of your data
  bool? Breadtype;

  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  BreadModel({
    this.isAvailable,
    required this.image,
    required this.id,
    this.Breadtype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static BreadModel empty() => BreadModel(
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
      "BreadType": Breadtype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory BreadModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return BreadModel.empty();
    final data = document.data()!;
    return BreadModel(
      id: document.id,
      title: data["Title"],
      Breadtype: data["BreadType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true,

    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory BreadModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return BreadModel(
      id: document.id,
      title: data["Title"],
      Breadtype: data["BreadType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true, // Adjusted this line

    );
  }
}
