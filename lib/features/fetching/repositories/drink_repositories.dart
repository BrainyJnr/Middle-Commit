import 'package:amazing/features/fetching/model/drink_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class DrinkRepository extends GetxController {
  static DrinkRepository get instance => Get.find();


  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<DrinkModel>> getFeaturedDrinks() async {
    try {
      final snapshot = await _db.collection("Foods").where("DrinkType",isEqualTo: true).get();
      return snapshot.docs.map((e) => DrinkModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }}