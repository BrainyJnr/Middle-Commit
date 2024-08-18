import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../personalization/models/crunches_model.dart';


class CrunchesRepository extends GetxController {
  static CrunchesRepository get instance => Get.find();


  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<CrunchesModel>> getFeaturedCrunches() async {
    try {
      final snapshot = await _db.collection("Crunches").get();
      return snapshot.docs.map((e) => CrunchesModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }}