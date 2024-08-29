import 'package:amazing/features/personalization/models/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class foodRepository extends GetxController {
  static foodRepository get instance => Get.find();


  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<FoodModel>> getFeaturedFoods() async {
    try {
      final snapshot = await _db.collection("Foods").where("FoodType",isEqualTo: true).get();
      return snapshot.docs.map((e) => FoodModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }



}