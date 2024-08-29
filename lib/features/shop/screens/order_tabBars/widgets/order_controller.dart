import 'dart:convert';
import 'package:amazing/features/shop/screens/cart_items/widget/model/cart_item_model.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/screen/success_screen.dart';
import '../../../../../data/repositories/authentication_repositories.dart';
import '../../../../../navigation/navigation_menu.dart';
import '../../../../../utilis/constants/enums.dart';
import '../../address/controller/address_controller.dart';
import '../../address/model/address_model.dart';
import '../../cart_items/widget/controller/cart_controller.dart';
import 'order_model.dart';
import 'order_repositories.dart';
import 'package:amazing/features/authentication/screens/loaders/fFullScreenLoader.dart';
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';

class OrderController extends GetxController {
  final OrderRepository _orderRepository = OrderRepository();
  final CartController cartController = Get.put(CartController());
  final AddressController addressController = Get.put(AddressController());

  bool isProcessingOrder = false;

  var oncomingOrders = <OrderModel>[].obs;
  var deliveredOrders = <OrderModel>[].obs;
  var cancelledOrders = <OrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserOrders();
  }

  Future<void> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isNotEmpty) {
        final userOrders = await _orderRepository.fetchUserOrders(userId);
        oncomingOrders.value = userOrders.where((order) => order.orderStatus ==
            OrderStatus.oncoming).toList();
        deliveredOrders.value = userOrders.where((order) => order.orderStatus ==
            OrderStatus.delivered).toList();
        cancelledOrders.value = userOrders.where((order) => order.orderStatus ==
            OrderStatus.cancelled).toList();
      } else {
        fLoaders.errorSnackBar(
            title: "User Error", message: "User ID is empty.");
      }
    } catch (e) {
      print("Error fetching orders: $e");
      fLoaders.errorSnackBar(title: "Fetch Error", message: e.toString());
    }
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    try {
      OrderModel? orderToUpdate = _findOrderById(orderId);

      if (orderToUpdate != null) {
        orderToUpdate.orderStatus = newStatus;
        await _orderRepository.updateOrderStatus(orderId, newStatus);
        _moveOrderToNewList(orderToUpdate, newStatus);
      } else {
        fLoaders.errorSnackBar(
            title: "Order Error", message: "Order not found.");
      }
    } catch (e) {
      print("Error updating order status: $e");
      fLoaders.errorSnackBar(title: "Update Error", message: e.toString());
    }
  }

  OrderModel? _findOrderById(String orderId) {
    return oncomingOrders.firstWhereOrNull((order) => order.id == orderId) ??
        deliveredOrders.firstWhereOrNull((order) => order.id == orderId) ??
        cancelledOrders.firstWhereOrNull((order) => order.id == orderId);
  }

  void _moveOrderToNewList(OrderModel order, OrderStatus newStatus) {
    oncomingOrders.remove(order);
    deliveredOrders.remove(order);
    cancelledOrders.remove(order);

    switch (newStatus) {
      case OrderStatus.oncoming:
        oncomingOrders.add(order);
        break;
      case OrderStatus.delivered:
        deliveredOrders.add(order);
        break;
      case OrderStatus.cancelled:
        cancelledOrders.add(order);
        break;
    }
  }


  Future<void> processOrder({
   // required double price,
    required List<String> imageUrls, // Change to a list
    required String title,
    required AddressModel address,
    required totalAmount,
  }) async {
    try {
      // Show loading dialog
      fFullScreenLoader.openLoadingDialog("Processing", fImages.Animation1);

      // Get user ID
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      // Generate order ID
      final orderId = DateTime.now().millisecondsSinceEpoch.toString();

      // Create OrderModel instance
      final order = OrderModel(
        id: orderId,
        title: title,
        userId: userId,
        totalAmount: totalAmount,
        orderImageUrls: imageUrls, // Adjust for a list of images
        orderStatus: OrderStatus.oncoming,
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(Duration(days: 3)), // Adjust delivery date as needed
        address: addressController.selectedAddress.value,
        items: cartController.cartItems.toList(),
      );

      // Save order to repository
      await _orderRepository.saveOrder(order, userId);

      // Update local state and clear cart
      oncomingOrders.add(order);
      cartController.clearCart();

      // Stop loading dialog and navigate to success screen
      fFullScreenLoader.stopLoading();
      Get.off(() => SuccessScreen(
        image: fImages.PaymentSuccessLogo,
        title: "Payment Success",
        subTitle: "Your items have been ordered!",
        onPressed: () => Get.offAll(() => Navigation_Menu()),
      ));
    } catch (e) {
      // Handle error
      fFullScreenLoader.stopLoading();
      fLoaders.errorSnackBar(title: "Order Error", message: e.toString());
    }
  }
}