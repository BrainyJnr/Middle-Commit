import 'package:amazing/features/shop/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../common/widgets/product_cart/cart_menu_icon.dart';
import '../common/widget/favorite.dart';
import '../common/widget/home.dart';
import '../common/widget/order.dart';
import '../common/widget/profile.dart';
import '../utilis/constants/colors.dart';
import '../utilis/theme/Theme_data.dart';

class Navigation_Menu extends StatefulWidget {
  const Navigation_Menu({super.key});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<Navigation_Menu> {
  Widget _currentScreen = HomeScreen(selectedText: true);
  final ThemeController themeController = Get.put(
      ThemeController()); // Get the ThemeController
  int _index = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageStorage(
          bucket: _bucket,
          child: _currentScreen,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: themeController.isDarkMode.value
            ? Colors.black
            : Colors.white,
        elevation: 0,
        onPressed: () => Get.to(CartScreen()) ,
        child: CircleAvatar(
          radius: 30.0, // Adjust the radius as needed
          backgroundColor: themeController.isDarkMode.value
              ? fColors.error
              : fColors.error,
          child: fCounterIcon(
           // onPressed: () {},
            iconColor: themeController.isDarkMode.value ? Colors.white : fColors
                .white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
            () =>
            BottomAppBar(
              surfaceTintColor: Colors.white,
              color: themeController.isDarkMode.value ? Colors.black : fColors
                  .white,
              shape: AutomaticNotchedShape(
                UnderlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
              notchMargin: 8.0,
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomNavigationItem(Iconsax.home1, Iconsax.home, 0,
                        HomeScreen(selectedText: true)),
                    _buildBottomNavigationItem(
                        Icons.favorite_outlined, Icons.favorite_border, 1,
                        const Favorite()),
                    const SizedBox(width: 40), // Space for the floating action button
                    _buildBottomNavigationItem(
                        Iconsax.bag_tick, Iconsax.bag, 2, const OrderScreen()),
                    _buildBottomNavigationItem(
                        Icons.person, Icons.person_outlined, 3,
                        const ProfileScreen()),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildBottomNavigationItem(IconData activeIcon, IconData inactiveIcon,
      int index, Widget screen) {
    return MaterialButton(
      minWidth: 60,
      onPressed: () {
        setState(() {
          _index = index;
          _currentScreen = screen;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _index == index ? activeIcon : inactiveIcon,
            color: _index == index ? fColors.black : Colors.grey,
          ),
        ],
      ),
    );
  }

}