import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/all_model.dart';

class AllRepository extends GetxController {
  static AllRepository get instance => Get.find();

  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<AllModel>> getFeaturedAll() async {
    try {
      final snapshot = await _db.collection("Foods").get();
      return snapshot.docs.map((e) => AllModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {
      throw "mmmmmmmmm$e";
    }
  }

  /// Get Products based on the Query

  /// Get Products based on the Query from Foods and Drinks collections
  Future<List<AllModel>> getFavoriteFoods(List<String> productIds) async {
    try {
      // Fetch from "Foods" collection
      final foodSnapshot = await _db
          .collection("Foods")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Fetch from "Drinks" collection
      final CrunchesSnapshot = await _db
          .collection("Crunches")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Map both snapshots to AllModel and combine them
      final foodItems = foodSnapshot.docs
          .map((querySnapshot) => AllModel.fromSnapshot(querySnapshot))
          .toList();

      final drinkItems = CrunchesSnapshot.docs
          .map((querySnapshot) => AllModel.fromSnapshot(querySnapshot))
          .toList();

      // Combine the two lists
      return [...foodItems, ...drinkItems];
    } on FirebaseException catch (e) {
      throw "Error: $e";
    } on PlatformException catch (e) {
      throw "Platform Error: $e";
    } catch (e) {
      throw "Unknown Error: $e";
    }
  }
}
