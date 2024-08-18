import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  Future addUserAddressDetails(Map<String, dynamic> UserAddressInfoMap,String id) async {
    return await FirebaseFirestore.instance.collection("UserAddress").doc(id).set(UserAddressInfoMap);
  }
}