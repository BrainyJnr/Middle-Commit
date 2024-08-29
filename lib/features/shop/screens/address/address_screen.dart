import 'package:amazing/features/functions/cloudfuunction.dart';
import 'package:amazing/features/shop/screens/address/controller/address_controller.dart';
import 'package:amazing/features/shop/screens/address/single_address.dart';
import 'package:amazing/features/shop/screens/checkout.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/appbar/fApp_bar.dart';
import 'add_new_address.dart';
import 'package:amazing/utilis/constants/sizes.dart';

import 'model/address_model.dart';

class addresscreen extends StatelessWidget {
  const addresscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

    return Scaffold(
      appBar: fAppBar(
        showBackArrow: true,
        title: Text(
          "Delivery Address",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () => Get.to(CheckoutScreen()),
                  child: Obx(
                        () =>  FutureBuilder(
                      // Use key to trigger refresh
                        key: Key(controller.refreshData.value.toString()),
                        future: controller.getAllUserAddresses(),
                        builder: (context, snapshot) {
                          /// Helper Function, Handle loader, Or Error message
                          final response = fCloudHelperFunctions
                              .checkMultiRecordState(snapshot: snapshot);
                          if (response != null) return response;

                          final address = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: address.length,
                            itemBuilder: (_, index) => fSingleAddress(
                                address: address[index],
                                onTap: () async {
                                  CircularProgressIndicator(color: Colors.red,);
                                  await controller.selectAddress(address[index]);
                                  Get.to(CheckoutScreen());

                                } ),
                          );
                        }),
                  )),
              const SizedBox(
                height: 270,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
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
  }
}
