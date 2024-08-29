import 'package:cloud_firestore/cloud_firestore.dart';

class IceModel {
  String id;
  String image;
  double? price;
  String title;
  bool? IceCreamtype;
  final bool? isAvailable; // Make sure this matches the type of your data


  //BrandModel? brand;
  String? description;

  // List<ProductVariationModel>? productVariations;

  IceModel({
    this.isAvailable,
    required this.image,
    required this.id,
    this.IceCreamtype,
    required this.title,
    this.price,
    // this.brand,
    this.description,
    // this.productVariations,
  });

  static IceModel empty() => IceModel(
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
      "IceCreamType": IceCreamtype,
      "Id": id,
      "Price": price,
      "Description": description,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory IceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return IceModel.empty();
    final data = document.data()!;
    return IceModel(
      id: document.id,
      title: data["Title"],
      IceCreamtype: data["IceCreamType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true,

    );
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory IceModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return IceModel(
      id: document.id,
      title: data["Title"],
      IceCreamtype: data["IceCreamType"] ?? false,
      image: data["Image"],
      price: double.parse((data["Price"] ?? 0.0).toString()),
      description: data["Description"],
      isAvailable: data['isAvailable'] == true, // Adjusted this line

    );
  }
}
