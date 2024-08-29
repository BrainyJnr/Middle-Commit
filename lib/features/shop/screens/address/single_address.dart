import 'package:amazing/features/shop/screens/address/controller/address_controller.dart';
import 'package:amazing/features/shop/screens/address/model/address_model.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/container/rounded_container.dart';
import '../../../../data/repositories/authentication_repositories.dart';
import 'edit_address.dart';

class fSingleAddress extends StatefulWidget {
  const fSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  State<fSingleAddress> createState() => _fSingleAddressState();
}

class _fSingleAddressState extends State<fSingleAddress> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    final dark = fHelperFunctions.isDarkMode(context);


    return Obx(() {
      final selectedAddress = controller.selectedAddress.value;
      final selectedAddressId = selectedAddress?.id;
      final isSelected = selectedAddressId == widget.address.id;

      return GestureDetector(
        onTap: widget.onTap,
        child: fRoundedContainer(
          padding: const EdgeInsets.all(fSizes.md),
          width: double.infinity,
          height: 150,
          backgroundColor: dark ? fColors.black : fColors.white,
          borderColor: isSelected ? Colors.red : Colors.grey.withOpacity(0.3),
          showBorder: true,
          margin: const EdgeInsets.only(bottom: fSizes.spaceBtwItems),
          child: Stack(
            children: [
              // Edit Icon
              Positioned(
                right: 5,
                top: 0,
                child: GestureDetector(
                  onTap: () => Get.to(EditScreen(address: widget.address)),
                  child: const Icon(Iconsax.edit, color: Colors.red),
                ),
              ),
              // Delete Icon
              Positioned(
                right: 5,
                bottom: 0,
                child: GestureDetector(
                        onTap: () async {
                          final shouldDelete = await showDialog<bool>(
                            context: context,
                            builder: (context) =>
                                AlertDialog(
                                  title: const Text('Confirm Delete'),
                                  content: const Text(
                                      'Are you sure you want to delete this address?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                          );

                          if (shouldDelete ?? false) {
                            final userId = AuthenticationRepository.instance
                                .authUser!.uid;
                            await controller.deleteAddress(userId, widget.address.id);
                          }
                        },
                        child: const Icon(Icons.delete, color: Colors.red),
                      ),
                ),

              // Address Information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Home",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
                  ),
                  const SizedBox(height: fSizes.md / 2),
                  Text(
                    widget.address.street,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,
                  ),
                  const SizedBox(height: fSizes.md / 2),
                  Text(
                    widget.address.phoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,
                  ),
                ],
              ),
              // Checkbox for selecting address
              Positioned(
                left: 0,
                bottom: 0,
                top: 90,
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.red,
                      value: isSelected,
                      onChanged: (value) {

                        }

                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Use as the Delivery address",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }}