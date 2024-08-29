import 'package:amazing/common/widget/tabBar.dart';
import 'package:amazing/features/fetching/controller/category_controller.dart';
import 'package:amazing/features/shop/shimmereffect/category_shimmer.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../appbar/fhome_appbar.dart';
import '../widgets/slider/promo_slider.dart';
import 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.selectedText});

  int isSelected = 0;
  final bool selectedText;

  @override
  Widget build(BuildContext context) {
    final HomeController tabController = Get.put(HomeController());
    final categoryController = Get.put(CategoryController());
    final ColorChangeController controller = Get.put(ColorChangeController());
    final screenSize = MediaQuery.of(context).size;
    final dark = fHelperFunctions.isDarkMode(context);

    return Scaffold(
        body: ScreenUtilInit(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const fHomeAppbar(),

              ///  Body - Banner
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: screenSize.width,
                        padding: const EdgeInsets.only(right: 18.0,left: 18.0,bottom: 16.0,top: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Row(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: 37,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red.withOpacity(0.3),
                                  ),
                                  child: const Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Selected Outlet",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                 const SizedBox(height: 4),
                                 Text(
                                  "Amazing Fried Chicken, 262",
                                  style: TextStyle(
                                    color: dark ? Colors.white : Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                                 Text(
                                  "Agbani Road, Enugu",
                                  style: TextStyle(
                                    color: dark ? Colors.white : Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Iconsax.arrow_right_34,
                            color: Colors.black,
                          ),
                        ])),
                  )),

              //.withOpacity(0.1),

              const SizedBox(height: 3),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 0.13),
                child: fpromoslider(),
              ),
              const SizedBox(height: 0.10, width: 0.300),

              const SizedBox(
                height: 3,
              ),
              const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  )),
                   Obx(() {
                    if (categoryController.isLoading.value) {
                      return const fCategoryShimmer();
                    }

                    if (categoryController.featuredCategories.isEmpty) {
                      return const Center(
                        child: Text(
                          "No Data Found!",
                          style: TextStyle(color: Colors.cyan),
                        ),
                      );
                    }

                    return Obx(
                      () => SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                categoryController.featuredCategories.length,
                            itemBuilder: (context, index) {
                              final category =
                                  categoryController.featuredCategories[index];

                              return GestureDetector(
                                onTap: () {
                                  tabController.changeTabIndex(index);
                                },
                                child: Obx(
                                  () => Container(
                                    margin:
                                        const EdgeInsets.symmetric(horizontal: 5.0),
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: tabController.getTabColor(index),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(width: 23,height: 24,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20)

                                          ),
                                         child:
                                        Image.network(
                                          category.image,
                                          width: 20,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        )),
                                        const SizedBox(width: 10),
                                     Obx(
                                       () => Text(
                                         category.name,
                                              style: TextStyle(
                                                color: tabController.getTextColor(index),
                                              ),
                                            ),
                                     ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                    );
                  }),

              const SizedBox(height: 14),
              // Added space between the tabs and the tab view

              // Use a SizedBox with a height to ensure it takes up space
              // SizedBox(height: MediaQuery.of(context).size.height, // Ensures it takes up the remaining space
              const SizedBox(
                height: 0.10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Obx(() {
                  return SingleChildScrollView(
                    child: TabView(
                      index: tabController.selectedIndex.value,
                    ),
                  );
                }),
              )
          ]),
        ),
      ),
        ) );
  }
}
