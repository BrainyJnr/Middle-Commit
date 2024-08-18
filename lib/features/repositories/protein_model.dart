import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../personalization/models/protein_model.dart';


class ProteinRepository extends GetxController {
  static ProteinRepository get instance => Get.find();


  /// FireStore instance for database interactions.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<ProteinModel>> getFeaturedProteins() async {
    try {
      final snapshot = await _db.collection("Foods").where("ProteinType",isEqualTo: true).get();
      return snapshot.docs.map((e) => ProteinModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "shddddddddd $e";
    } on PlatformException {
      throw "eeeeeeeeeeeeeee";
    } catch (e) {

      throw "mmmmmmmmm$e";

    }
  }}