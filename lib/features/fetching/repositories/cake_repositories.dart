import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/cake_model.dart';


class cakeRepository extends GetxController {
  static cakeRepository get instance => Get.find();


  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<CakeModel>> getFeaturedCakes() async {
    try {
      final snapshot = await _db.collection("Foods").where("CakeType",isEqualTo: true).get();
      return snapshot.docs.map((e) => CakeModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }}