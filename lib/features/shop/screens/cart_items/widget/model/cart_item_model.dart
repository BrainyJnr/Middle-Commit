

class CartItemModel {
  String foodId;
  String title;
  double price;
  String image;
  int quantity;
  final String? imagePath; // Ensure this field exists

  //String variationId;
 // String? brandName;
 // Map<String, String>? selectedVariation;

  /// Controller
  CartItemModel({
    required this.foodId,
    required this.quantity,
   // this.variationId = "",
    required  this.image,
    this.imagePath,
    this.price = 0.0,
    this.title = "",
   // this.brandName,
    //this.selectedVariation,
  });

  /// Empty Cart
  static CartItemModel empty() => CartItemModel(foodId: "", quantity: 0, image: '');

  /// Convert a CartItem to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      "foodId": foodId,
      "title": title,
      "price": price,
      "image": image,
      "imagePath": imagePath,
      "quantity": quantity,
     // "variationId": variationId,
      //"brandName": brandName,
      //"selectedVariation": selectedVariation,
    };
  }

  /// Create a CartItem from a JSON Map
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      foodId: json["foodId"] ?? "",
      title: json["title"] ?? "",
      price: json["price"] ?? 0.0,
      image: json["image"] ,
      imagePath: json["imagePath"] ,
      quantity: json["quantity"],
      //variationId: json["variationId"],
     // brandName: json["brandName"],
     // selectedVariation: json["selectedVariation"] != null ? Map<String, String>.from(json["selectedVariation"]) : null,
    );
  }
}
