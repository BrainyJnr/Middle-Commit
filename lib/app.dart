import 'package:amazing/utilis/theme/Theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/general_binding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        // getPages: AppRoutes.pages,
        home: const Scaffold(),
      ),
    );
  }
}
