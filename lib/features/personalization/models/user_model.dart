import 'package:amazing/utilis/formatters/formatters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // Keep those values final which you do not want to update
  final String id;
   String fullName;
   String email;
  String phoneNumber;
  String birthday;
  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.birthday,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  String get allName => fullName;

  /// Helper function to format phone number
  String get formattedPhoneNo => fFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name
  static List<String> nameParts(String fullName) => fullName.split(" ");

  /// static function to generate a username from the full name.
  static String generateUsername(String fullNames) {
    List<String> nameParts = fullNames.split("");
    String firstName = nameParts[0].toLowerCase();
    String camelCaseUsername = firstName;
    String usernameWithPrefix = camelCaseUsername;
    return usernameWithPrefix;
  }
  /// static function to create an empty user model
  static UserModel empty() => UserModel(
    id: '',
    fullName: "",
    email: "",
    phoneNumber: "", birthday: '',
  );

  /// convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "BirthDay": birthday,
    };
  }


  /// factory method create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        fullName: data["FullName"] ?? "",
        email: data["Email"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        birthday: data["BirthDay"] ?? "",
      );
    } else {
      return UserModel.empty();
    }
  }
}