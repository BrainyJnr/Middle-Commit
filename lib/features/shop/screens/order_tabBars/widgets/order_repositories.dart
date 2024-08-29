import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../../data/repositories/authentication_repositories.dart';
import '../../../../../utilis/constants/enums.dart';
import 'order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get all orders related to the current user
  Future<List<OrderModel>> fetchUserOrders(String userId) async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty)
        throw "Unable to find user information. Try again in few minutes.";

      final result =
          await _db.collection("Users").doc(userId).collection("Orders").get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw "Something went wrong while fetching Order Information. $e ";
    }
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    try {
      // Reference to the order document
      DocumentReference orderDocRef =
          _firestore.collection('Orders').doc(orderId);

      // Update the order status
      await orderDocRef.update({
        'orderStatus': newStatus.toString(),
      });
    } catch (e) {
      print("Error updating order status: $e");
      throw e; // Re-throw the exception to be handled by the calling method
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    await _firestore
        .collection('Users')
        .doc(userId)
        .collection('Orders')
        .doc(order.id)
        .set(order.toJson());
  }
}
