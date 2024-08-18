import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/bread_model.dart';


class BreadRepositories extends GetxController {
  static BreadRepositories get instance => Get.find();


  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<BreadModel>> getFeaturedBread() async {
    try {
      final snapshot = await _db.collection("Foods").where("BreadType",isEqualTo: true).get();
      return snapshot.docs.map((e) => BreadModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }}