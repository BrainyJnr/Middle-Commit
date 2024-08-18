// CategoryModel.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = "",
  });

  /// Empty Helper Function
  static CategoryModel empty() => CategoryModel(id: "", image: "", name: "");

  /// Convert model to Json structure so that you can store data in Firebase
  static CategoryModel fromMap(Map<String, dynamic> data, String id) {
    return CategoryModel(
      id: id,
      name: data['Name'] ?? '',  // Check if 'Name' is present
      image: data['Image'] ?? '', // Check if 'Image' is present
      parentId: data['ParentId'] ?? '', // Check if 'ParentId' is present
    );
  }

  /// Map Json Oriented document snapshot from Firebase to CategoryModel.
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return CategoryModel(
        id: document.id,
        name: data["Name"] ?? "",
        image: data["Image"] ?? "",
        parentId: data["ParentId"] ?? "",
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
