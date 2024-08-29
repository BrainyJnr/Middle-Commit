import 'package:cloud_firestore/cloud_firestore.dart';

class shawarmaModel {
  String id;
  String image;
  double? price;
  String title;
  bool? shawarmatype;
  final bool? isAvailable; // Make sure this matches the type of your data


  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  shawarmaModel({
    required this.image,
    required this.id,
    this.shawarmatype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    this.isAvailable,

    // this.productVariations,
  });

  static shawarmaModel empty() => shawarmaModel(
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
      "ShawarmaType": shawarmatype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory shawarmaModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return shawarmaModel.empty();
    final data = document.data()!;
    return shawarmaModel(
      id: document.id,
      title: data["Title"],
      shawarmatype: data["ShawarmaType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true,

    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory shawarmaModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return shawarmaModel(
      id: document.id,
      title: data["Title"],
      shawarmatype: data["ShawarmaType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true, // Adjusted this line

    );
  }
}