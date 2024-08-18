import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utilis/exceptions/fFormat_exception.dart';
import '../../../utilis/exceptions/ffirebase_exception.dart';
import '../../../utilis/exceptions/fplatform_excepton.dart';
import '../../personalization/models/banner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();


  /// Variables
  final _db = FirebaseFirestore.instance;


  /// Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection("Banners")
        .where("IsFeatured", isEqualTo: true).get();
      return result.docs.map((documentSnapshot) =>
          BannerModel.fromSnapshot(documentSnapshot)).toList();

    } on FirebaseException catch (e) {
      throw fFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const fFormatException();
    } on PlatformException catch (e) {
      throw fPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong while fetching Banners. $e";
    }
  }


}