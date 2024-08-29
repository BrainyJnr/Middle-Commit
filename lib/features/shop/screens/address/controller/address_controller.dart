import 'package:amazing/features/authentication/screens/loaders/fFullScreenLoader.dart';
import 'package:amazing/features/authentication/screens/loaders/floaders.dart';
import 'package:amazing/features/functions/cloudfuunction.dart';
import 'package:amazing/features/shop/screens/address/model/address_model.dart';
import 'package:amazing/features/shop/screens/address/repository/addres_repository.dart';
import 'package:amazing/utilis/constants/fsize.dart';
import 'package:amazing/utilis/constants/image_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/repositories/authentication_repositories.dart';
import '../../../../../utilis/managers/network_managers.dart';
import '../single_address.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  // Controllers for form fields
  final street = TextEditingController();
  final phoneNumber = TextEditingController();
  final direction = TextEditingController();
  final isLoading = false.obs;

  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var addresses = <AddressModel>[].obs;
  var isDeleting = true.obs;
  final AddressRepository addressRepository = Get.put(AddressRepository());
  RxBool refreshData = true.obs;
  var selectedAddresses = Rxn<AddressModel>(); // Nullable selected address
  // Method to select an address
  void selectAddresses(AddressModel address) {
    selectedAddress.value = address;
  }

  // Method to load addresses (e.g., from Firestore)

  // Fetch all user-specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      fLoaders.errorSnackBar(title: "Address not found", message: e.toString());
      return [];
    }
  }

  // Method to select and update the selected address
  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: "",
        onWillPop: () async => false,
        barrierDismissible: false,
        backgroundColor: Colors.red.withOpacity(0.1),
        content: CircularProgressIndicator(color: Colors.red),
      );

      // Clear the "selected" field of the previous selected address
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "Selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      fLoaders.errorSnackBar(
          title: "Error in Selection", message: e.toString());
    }
  }

  // Add a new address
  Future<void> addNewAddresses() async {
    try {
      fFullScreenLoader.openLoadingDialog(
          "Storing Address...", fImages.Animation1);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: "",
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        selectedAddress: true,
        direction: direction.text.trim(),
      );
      final id = await addressRepository.addAddress(address);

      address.id = id;
      await selectedAddress(address);

      fFullScreenLoader.stopLoading();

      fLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your address has been saved successfully.");

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      fFullScreenLoader.stopLoading();
      fLoaders.errorSnackBar(title: "Address not found", message: e.toString());
    }
  }

  // Delete an address

  // Method to select an address
  void selectAddressess(AddressModel address) {
    selectedAddress.value = address;
  }

  // Update an existing address
  Future<void> updateAddress(AddressModel updatedAddress) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await addressRepository.updateAddress(userId, updatedAddress);
      refreshData.toggle();

      // Update the address in the local observable list
      final index =
          addresses.indexWhere((address) => address.id == updatedAddress.id);
      if (index != -1) {
        addresses[index] =
            updatedAddress; // This will update the UI immediately
      }

      fLoaders.successSnackBar(
        title: "Success",
        message: "Address updated successfully.",
      );
    } catch (e) {
      fLoaders.errorSnackBar(
        title: "Error",
        message: "Failed to update address: $e",
      );
    }
  }

  Future<void> deleteAddress(String id, String addressId) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;

      // Call the repository to delete the address from the backend
      await addressRepository.deleteAddress(userId, addressId);

      // Remove the address from the local list
      addresses.removeWhere((address) => address.id == addressId);

      // If the deleted address was the selected one, reset selectedAddress to an empty AddressModel
      if (selectedAddress.value.id == addressId) {
        selectedAddress.value =
            AddressModel(direction: '', street: '', id: '', phoneNumber: ''); //
        refreshData.toggle();
       //  resetFormFields();
      }
    } catch (e) {
      print("Failed to delete address: $e");
      // Handle errors here, such as showing a message to the user
    }
  }

  // Method to select an address
  void selectsAddress(AddressModel address) {
    selectedAddress.value = address;
  }

  // Show Address ModalBottomSheet for Checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: EdgeInsets.all(fSizes.md),
        child: FutureBuilder(
          future: getAllUserAddresses(),
          builder: (_, snapshot) {
            final response =
                fCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
            if (response != null) return response;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => fSingleAddress(
                address: snapshot.data![index],
                onTap: () async {
                  await selectAddress(snapshot.data![index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  // Reset form fields
  void resetFormFields() {
    phoneNumber.clear();
    street.clear();
    direction.clear();
    addressFormKey.currentState?.reset();
  }
}
