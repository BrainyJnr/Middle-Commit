import 'package:cloud_firestore/cloud_firestore.dart';
import '../../address/model/address_model.dart';
import '../../cart_items/widget/model/cart_item_model.dart';
import '../../../../../utilis/helpers/helper_functions.dart';
import '../../../../../utilis/constants/enums.dart';

class OrderModel {
  final String id;
  final String userId;
  final String title;
  final double totalAmount;
  final List<String> orderImageUrls; // Changed to list
   OrderStatus orderStatus;
  final DateTime orderDate;
  final AddressModel? address;
  final String paymentMethod;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = "",
    required this.title,
    required this.items,
    required this.totalAmount,
    required this.orderImageUrls, // Changed to list
    required this.orderStatus,
    required this.orderDate,
    this.deliveryDate,
    this.paymentMethod = "Paystack",
    this.address,
  });

  String get formattedOrderDate => fHelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? fHelperFunctions.getFormattedDate(deliveryDate!)
      : "";

  OrderModel copyWith({
    String? id,
    String? userId,
    double? price,
    String? title,
    List<CartItemModel>? items,
    double? totalAmount,
    List<String>? orderImageUrls, // Changed to list
    OrderStatus? orderStatus,
    DateTime? orderDate,
    AddressModel? address,
    String? paymentMethod,
    DateTime? deliveryDate,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      orderImageUrls: orderImageUrls ?? this.orderImageUrls, // Changed to list
      orderStatus: orderStatus ?? this.orderStatus,
      orderDate: orderDate ?? this.orderDate,
      address: address ?? this.address,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      deliveryDate: deliveryDate ?? this.deliveryDate,
    );
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('Document data is null');
    }

    return OrderModel(
      id: snapshot.id,
      title: data['title'] ?? '',
      address: data['address'] != null
          ? AddressModel.fromMap(data['address'] as Map<String, dynamic>)
          : null,
      totalAmount: (data['totalAmount'] as num?)?.toDouble() ?? 0.0,
      orderImageUrls: List<String>.from(data['orderImageUrls'] ?? []), // Changed to list
      paymentMethod: data['paymentMethod'] as String? ?? 'Paystack',
      orderStatus: data['orderStatus'] != null
          ? OrderStatus.values.firstWhere(
            (e) => e.toString() == 'OrderStatus.${data['orderStatus']}',
        orElse: () => OrderStatus.oncoming,
      )
          : OrderStatus.oncoming,
      orderDate: data['orderDate'] is Timestamp
          ? (data['orderDate'] as Timestamp).toDate()
          : DateTime.parse(data['orderDate'] as String),
      deliveryDate: data['deliveryDate'] != null
          ? (data['deliveryDate'] is Timestamp
          ? (data['deliveryDate'] as Timestamp).toDate()
          : DateTime.parse(data['deliveryDate'] as String))
          : null,
      items: (data['items'] as List<dynamic>?)
          ?.map((itemData) => CartItemModel.fromJson(itemData as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'userId': userId,
      'totalAmount': totalAmount,
      'orderImageUrls': orderImageUrls, // Changed to list
      'address': address?.toJson(),
      'paymentMethod': paymentMethod,
      'orderStatus': orderStatus.toString().split('.').last,
      'orderDate': Timestamp.fromDate(orderDate),
      'deliveryDate': deliveryDate != null ? Timestamp.fromDate(deliveryDate!) : null,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      orderImageUrls: List<String>.from(json['orderImageUrls'] ?? []), // Changed to list
      orderStatus: OrderStatus.values.firstWhere(
            (e) => e.toString() == 'OrderStatus.${json['orderStatus']}',
        orElse: () => OrderStatus.oncoming,
      ),
      orderDate: DateTime.parse(json['orderDate'] as String),
      items: (json['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      deliveryDate: json['deliveryDate'] != null
          ? DateTime.parse(json['deliveryDate'] as String)
          : null,
      address: json['address'] != null
          ? AddressModel.fromMap(json['address'] as Map<String, dynamic>)
          : null,
    );
  }
}
