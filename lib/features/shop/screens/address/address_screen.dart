import 'package:amazing/features/shop/screens/address/single_address.dart';
import 'package:amazing/features/shop/screens/checkout.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/appbar/fApp_bar.dart';
import 'add_new_address.dart';import 'package:amazing/utilis/constants/sizes.dart';


class addresscreen extends StatelessWidget {
  const addresscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fAppBar(
        showBackArrow: true, title: Text("Delivery Address", style: Theme
          .of(context)
          .textTheme
          .titleMedium,
      ),),

      body: SingleChildScrollView(

        child: Padding(padding: const EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            children: [
              GestureDetector(onTap: () => Get.to(const CheckoutScreen()),
                  child: const fSingleAddress(selectedAddress: true,)),
              const fSingleAddress(selectedAddress: false),


              const SizedBox(height: 270,),
                   SizedBox(
                     height: 50,
                     width: double.infinity,
                       child:     ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: fColors.error,
                    ),
                    onPressed: () => Get.to(const AddnewAddress()),
                    child: const Text(
                      "Add New Address",
                      style: TextStyle(color: Colors.white),
                    )),
                   )
            ],
          ),
        ),
      ),
    );
  }}





