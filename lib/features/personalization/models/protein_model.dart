import 'package:cloud_firestore/cloud_firestore.dart';

class ProteinModel {
  String id;
  String image;
  double? price;
  String title;
  bool? Proteintype;

  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  ProteinModel({
    required this.image,
    required this.id,
    this.Proteintype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static ProteinModel empty() => ProteinModel(
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
      "ProteinType": Proteintype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProteinModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProteinModel.empty();
    final data = document.data()!;
    return ProteinModel(
      id: document.id,
      title: data["Title"],
      Proteintype: data["ProteinType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProteinModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProteinModel(
      id: document.id,
      title: data["Title"],
      Proteintype: data["ProteinType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],


    );
  }
}