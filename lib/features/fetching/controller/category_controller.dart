// CategoryController.dart
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:amazing/features/personalization/models/category_model.dart';
import 'package:amazing/features/repositories/categories.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// -- Load category data
  Future<void> fetchCategories() async {
    try {
      /// Show loader while loading categories
      isLoading.value = true;

      /// Fetch categories from data source (FireStore, API, etc)
      final categories = await _categoryRepository.getAllCategories();

      /// Update the categories list
      allCategories.assignAll(categories);

      /// Filter featured categories (where parentId is empty or null)
      featuredCategories.assignAll(
        allCategories.where((category) => category.parentId.isEmpty).toList(),
      );

      if (featuredCategories.isEmpty) {
        print("No featured categories found.");
      } else {
        print("Featured categories fetched: ${featuredCategories.length}");
      }

    } catch (e) {
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      /// Remove loader
      isLoading.value = false;
    }
  }

}
