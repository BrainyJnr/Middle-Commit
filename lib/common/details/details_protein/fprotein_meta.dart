import 'package:amazing/features/fetching/controller/protein_controller.dart';
import 'package:amazing/features/personalization/models/protein_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/food_price/food_price.dart';

class fProtreintMetaData extends StatelessWidget {
  const fProtreintMetaData({super.key, required this.protein});

  final ProteinModel protein;

  @override
  Widget build(BuildContext context) {
    final controller = Protein_Controller.instance;
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  protein.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Row(
                children: [
                  foodprice(
                    price: controller.getFoodPrice(protein),
                  )
                ],
              ))
        ]);
  }
}