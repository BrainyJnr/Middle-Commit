import 'package:amazing/utilis/formatters/formatters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  final String phoneNumber;
  final String street;
  String direction;

  // final String city;
  // final String state;
  // final String postalCode;
  // final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel(
      {required this.direction,
      required this.id,
      required this.phoneNumber,
      required this.street,
      this.dateTime,
      this.selectedAddress = true});

  String get formattedPhoneNo => fFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
        id: "",
        phoneNumber: "",
        street: "",
        direction: "",
      );

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "PhoneNumber": phoneNumber,
      "Street": street,
      "Direction": direction,
      "DateTime": DateTime.now(),
      "SelectedAddress": selectedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
        id: data["Id"] as String,
        phoneNumber: data["PhoneNumber"] as String,
        direction: data["Direction"] as String,
        street: data["Street"] as String,
        selectedAddress: data["SelectedAddress"] as bool,
        dateTime: (data["DateTime"] as Timestamp).toDate());
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
      id: snapshot.id,
      phoneNumber: data["PhoneNumber"] ?? "",
      street: data["Street"] ?? "",
      direction: data["Direction"] ?? "",
      selectedAddress: data["SelectedAddress"] as bool,
      dateTime: (data["DateTime"] as Timestamp).toDate(),
    );
  }

  @override
  String toString() {
    return "$street,";
  }
}
