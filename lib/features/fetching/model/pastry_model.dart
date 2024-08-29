import 'package:cloud_firestore/cloud_firestore.dart';

class PastryModel {
  String id;
  String image;
  double? price;
  String title;
  final bool? isAvailable; // Make sure this matches the type of your data
  bool? Pastrytype;

  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  PastryModel({
    this.isAvailable,
    required this.image,
    required this.id,
    this.Pastrytype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static PastryModel empty() => PastryModel(
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
      "PastryType": Pastrytype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory PastryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return PastryModel.empty();
    final data = document.data()!;
    return PastryModel(
      id: document.id,
      title: data["Title"],
      Pastrytype: data["PastryType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true,

    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory PastryModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return PastryModel(
      id: document.id,
      title: data["Title"],
      Pastrytype: data["ProteinType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true, // Adjusted this line

    );
  }
}