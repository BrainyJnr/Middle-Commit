import 'package:amazing/common/widgets/favorites/favorite_2.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import '../appbar/fApp_bar.dart';
import '../widgets/favorites/fFavorite_list_view_Seperated.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fAppBar(
        title: Text(
          "Favorites",
          style: Theme
              .of(context)
              .textTheme
              .titleMedium!
              .apply(color: fColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 22, top: 12,right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              favorite_list_view_seperated(itemCount: 2,itemBuilder:  (_,index) => const favorite2(),)
       ] ),
      ),
    ));
  }
}

