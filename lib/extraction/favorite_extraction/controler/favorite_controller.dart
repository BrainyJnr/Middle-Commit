import 'dart:convert';
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:amazing/features/crunches/crunches_repositories.dart';
import 'package:amazing/features/fetching/model/all_model.dart';
import 'package:amazing/features/fetching/repositories/all_repositories.dart';
import 'package:amazing/features/personalization/models/crunches_model.dart';
import 'package:amazing/utilis/local_storage/storage_utility.dart';

import 'package:get/get.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();


  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites()  {
    final json = fLocalStorage.instance().readData("favorites");
    if(json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }
  bool isFavorites(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
     // fLoaders.customToast(message: "Product has been added to the Wishlist.");
    } else {
      fLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
    //  fLoaders.customToast(message: "Product has been removed from the Wishlist.");
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    fLocalStorage.instance().saveData("favorites", encodedFavorites);
  }

  Future<List<AllModel>> favoriteProducts() async {
    return await AllRepository.instance.getFavoriteFoods(favorites.keys.toList());
  }
  Future<List<CrunchesModel>> favorite2() async {
    return await CrunchesRepository.instance.getFavoriteFoods(favorites.keys.toList());
  }

}