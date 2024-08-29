import 'package:amazing/features/shop/screens/address/controller/address_controller.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:amazing/utilis/validators/fvalidators.dart';
import 'package:flutter/material.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';

import '../../../../common/appbar/fApp_bar.dart';

class AddnewAddress extends StatelessWidget {
  const AddnewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return Scaffold(
        appBar: fAppBar(
            showBackArrow: true,
            title: Text(
              "Add new Address",
              style: Theme.of(context).textTheme.titleMedium,
            )),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(
              top: 10,
              left: fSizes.defaultSpace,
              right: fSizes.defaultSpace,
              bottom: fSizes.defaultSpace),
          child: Container(
            child: Column(
              children: [
                Form(
                  key: controller.addressFormKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Delivery Details"),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                          controller: controller.street,
                          validator: (value) => fValidator.validateEmptyText("Street", value),
                          cursorColor: Colors.black.withOpacity(0.1),
                          expands: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(14),
                            border:
                                const OutlineInputBorder(borderSide: BorderSide()),
                            //  focusedBorder: UnderlineInputBorder(
                            //  borderSide: BorderSide(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),

                            hintText: "Enter your street",
                            labelText: "Street",
                            labelStyle:
                                 TextStyle(color: dark ? Colors.white : Colors.black54),
                            hintStyle: Theme.of(context).textTheme.bodySmall!.apply(color: dark ? Colors.white : Colors.black54),
                          )),
                      const SizedBox(
                        height: 1,
                      ),
                       Text(
                        "You can select a popular location closest to you",
                        style: TextStyle(color: dark ? Colors.white : Colors.black54, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: controller.phoneNumber,
                        validator: (value) => fValidator.validateEmptyText("Phone Number", value),
                        expands: false,
                        cursorColor: Colors.black.withOpacity(0.1),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(14),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5))),

                          //  focusedBorder: UnderlineInputBorder(
                          //  borderSide: BorderSide(
                          hintText: "Enter your phone number",
                          labelText: "Phone Number",
                          labelStyle:
                               TextStyle(color: dark ? Colors.white : Colors.black54),
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(children: [
                        SizedBox(
                            height: 300,
                            child: TextFormField(
                                controller: controller.direction,
                              cursorColor: Colors.black.withOpacity(0.1),
                                expands: false,
                                //  minLines: 30,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  //  focusedBorder: UnderlineInputBorder(
                                  //  borderSide: BorderSide(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5))),
                                  hintText:
                                      "You can give extra details on location",
                                  labelText: "Direction (Optional)",
                                  labelStyle:  TextStyle(
                                      color: dark ? Colors.white : Colors.black54, fontSize: 12),
                                  hintStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                ))),
                      ]),
                    ])),

                // Padding(padding: EdgeInsets.only(bottom: 900),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: fColors.error,
                      ),
                    onPressed: () => controller.addNewAddresses(),
                      child: const Text(
                        "Save And Proceed",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        )));
  }
}
