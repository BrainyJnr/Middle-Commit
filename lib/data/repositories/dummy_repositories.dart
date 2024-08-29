import 'package:amazing/features/personalization/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../services/firebase_storage_service.dart';

class dummyRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<void> uploadDummydata(List<CategoryModel> category) async {
    try {
      final storage = Get.put(fFirebaseStorageService());

      for (var item in category) {
        final file = await storage.getImageDataFromAssets(item.image);

        final url = await storage.uploadImageData("Ca", file, item.name);

        item.image = url;

        //await _db.collection("category").doc(item.id).set(item.toJson());
      }
    } on FirebaseException catch (e) {
      throw "========$e=======here";
    } on PlatformException catch (e) {
      throw "===========$e=====================";
    } catch (e) {
      throw "Something went wrong $e";
    }
  }
}
