import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/sharwama_model.dart';


class shawarmaRepository extends GetxController {
  static shawarmaRepository get instance => Get.find();


  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<shawarmaModel>> getFeaturedShawar() async {
    try {
      final snapshot = await _db.collection("Foods").where("ShawarmaType",isEqualTo: true).get();
      return snapshot.docs.map((e) => shawarmaModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }}