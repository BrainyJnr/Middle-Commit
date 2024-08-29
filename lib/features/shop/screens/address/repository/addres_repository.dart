import 'package:amazing/data/repositories/authentication_repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;



  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty)
        throw "Unable to find user Information Try again in few minutes";

      final result = await _db
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .get();
      return result.docs
          .map((documentSnapshot) =>
              AddressModel.fromDocumentSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw "Something went wrong while fetching Address Information. Try again later";
    }
  }
  Future<void> deleteAddress(String userId, String addressId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("Addresses")
          .doc(addressId)
          .delete();
    } catch (e) {
      throw "Unable to delete address. Try again later";
    }}
  Future<void> updateAddress(String userId, AddressModel address) async {
    try {
      await _db.collection("Users").doc(userId).collection("Addresses").doc(address.id).update(address.toJson());
    } catch (e) {
      throw "Unable to update address. Try again later.";
    }
  }

  // Clear the "Selected" field for all addresses
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db.collection("Users").doc(userId).collection("Addresses").doc(addressId).update({"SelectedAddress" : selected});
    } catch (e) {
      throw "Unable to update your selection. Try again later";
    }
  }

  /// Store new user address
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db.collection("Users").doc(userId).collection("Addresses").add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw "Something went wrong while saving address Information. Try again later";
    }
  }
}
