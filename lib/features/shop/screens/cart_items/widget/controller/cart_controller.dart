import 'package:amazing/common/widget/protein.dart';
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:amazing/features/fetching/model/bread_model.dart';
import 'package:amazing/features/fetching/model/cake_model.dart';
import 'package:amazing/features/fetching/model/drink_model.dart';
import 'package:amazing/features/fetching/model/icecream_model.dart';
import 'package:amazing/features/fetching/model/pastry_model.dart';
import 'package:amazing/features/fetching/model/promo_model.dart';
import 'package:amazing/features/fetching/model/sharwama_model.dart';
import 'package:amazing/features/personalization/models/food_model.dart';
import 'package:amazing/features/personalization/models/protein_model.dart';
import 'package:amazing/utilis/local_storage/storage_utility.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../../../../../fetching/model/all_model.dart';
import '../../../../../personalization/models/crunches_model.dart';
import '../model/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartController() {
    loadCartItems();
  }

  // Add Items in the cart
  void addAllCartToCart(FoodModel food) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(food, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addCrunchiesToCart(CrunchesModel crunch) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(crunch, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addProteinToCart(ProteinModel protein) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(protein, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addPastryToCart(PastryModel pastry) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(pastry, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addCakeToCart(CakeModel cake) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(cake, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addBreadToCart(BreadModel bread) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(bread, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addIceToCart(IceModel Ice) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(Ice, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addshawarToCart(shawarmaModel Shawar) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(Shawar, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addspromoToCart(PromoModel promo) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(promo, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addDrinkCart(DrinkModel drink) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(drink, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  void addallCart(AllModel all) {
    if (productQuantityInCart.value < 1) {
      fLoaders.customToast(message: "Select Quantity");
      return;
    }
    final cartItem = convertToCartItem(all, productQuantityInCart.value);
    addOneToCart(cartItem);
    fLoaders.customToast(message: "Product added to cart");
  }

  // Convert AllModel or CrunchesModel to CartItemModel
  CartItemModel convertToCartItem(dynamic all, int quantity) {
    if (all is FoodModel) {
      return CartItemModel(
        foodId: all.id,
        title: all.title,
        price: all.price ?? 0.0,
        // Handle null price
        quantity: quantity,
        image: all.image,
      );
    } else if (all is CrunchesModel) {
      return CartItemModel(
        foodId: all.id,
        title: all.title,
        price: all.price ?? 0.0,
        // Handle null price
        quantity: quantity,
        image: all.image,
      );
    } else if (all is ProteinModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else if (all is PastryModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else if (all is CakeModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else if (all is BreadModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else if (all is IceModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else if (all is shawarmaModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else if (all is PromoModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else if (all is DrinkModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else if (all is AllModel) {
      return CartItemModel(
          foodId: all.id,
          title: all.title,
          price: all.price ?? 0.0,
          quantity: quantity,
          image: all.image);
    } else {
      throw Exception("Unsupported product type");
    }
  }

  void addOneToCart(CartItemModel item) {
    int index =
        cartItems.indexWhere((cartItem) => cartItem.foodId == item.foodId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index =
        cartItems.indexWhere((cartItem) => cartItem.foodId == item.foodId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCart(CartItemModel item) {
    final foundItem = cartItems
        .firstWhereOrNull((cartItem) => cartItem.foodId == item.foodId);

    if (foundItem != null) {
      if (foundItem.quantity > 1) {
        // Decrease the quantity of the item
        foundItem.quantity -= 1;
      } else {
        // Remove the item from the cart
        cartItems.remove(foundItem);
      }
      updateCart(); // Update cart totals and refresh UI
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: "Remove Item",
      middleText: "Are you sure you want to remove this Item",
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        fLoaders.customToast(message: "Item removed from the Cart");
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    fLocalStorage.instance().writeData("cartItems", cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        fLocalStorage.instance().readData<List<dynamic>>("cartItems");
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }
  // Method to fetch image URL from Firebase Storage
  Future<String> fetchImageUrl(String imagePath) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(imagePath);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error fetching image URL: $e');
      return ''; // Handle error appropriately
    }
  }

  // Fetch all cart items with image URLs
  Future<List<Map<String, dynamic>>> getCartItemsWithImages() async {
    List<Map<String, dynamic>> itemsWithImages = [];
    for (var item in cartItems) {
      final imageUrl = await fetchImageUrl(item.image); // Assuming image is available
      itemsWithImages.add({
        'title': item.title,
        'price': item.price,
        'imageUrl': imageUrl,
      });
    }
    return itemsWithImages;
  }

  int getProductQuantityInCart(String foodId) {
    final foundItem = cartItems
        .where((item) => item.foodId == foodId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
