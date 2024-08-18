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
  }}