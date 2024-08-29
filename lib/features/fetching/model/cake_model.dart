import 'package:cloud_firestore/cloud_firestore.dart';

class CakeModel {
  String id;
  String image;
  double? price;
  String title;
  bool? Caketype;
  final bool? isAvailable; // Make sure this matches the type of your data


  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  CakeModel({
    this.isAvailable,
    required this.image,
    required this.id,
    this.Caketype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static CakeModel empty() => CakeModel(
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
      "CakeType": Caketype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory CakeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return CakeModel.empty();
    final data = document.data()!;
    return CakeModel(
      id: document.id,
      title: data["Title"],
      Caketype: data["CakeType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true,
    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory CakeModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return CakeModel(
      id: document.id,
      title: data["Title"],
      Caketype: data["CakeType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true, // Adjusted this line

    );
  }
}
