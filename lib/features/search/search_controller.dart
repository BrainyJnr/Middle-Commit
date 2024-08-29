import 'dart:async';
import 'package:amazing/features/fetching/model/sharwama_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:async/async.dart';

import '../fetching/model/bread_model.dart';
import '../fetching/model/cake_model.dart';
import '../fetching/model/drink_model.dart';
import '../fetching/model/icecream_model.dart';
import '../fetching/model/pastry_model.dart';
import '../fetching/model/promo_model.dart';
import '../personalization/models/food_model.dart';
import '../personalization/models/protein_model.dart';



class SearchPage extends GetxController {
  final Rx<List<dynamic>> _searchResults = Rx<List<dynamic>>([]);
  Timer? _debounce;

  List<dynamic> get searchResults => _searchResults.value;

  void search(String query) {
    if (query.isEmpty) {
      _searchResults.value = [];
      return;
    }

    // Debounce the search operation
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _performSearch(query);
    });
  }

  void _performSearch(String query) {
    String upperCaseQuery = query.toUpperCase();
    String endString = upperCaseQuery.substring(0, upperCaseQuery.length - 1) +
        String.fromCharCode(
            upperCaseQuery.codeUnitAt(upperCaseQuery.length - 1) + 1);

    var foodStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => FoodModel.fromQuerySnapshot(doc))
        .toList());

    var proteinStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => ProteinModel.fromQuerySnapshot(doc))
        .toList());

    var pastryStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => PastryModel.fromQuerySnapshot(doc))
        .toList());

    var cakeStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => CakeModel.fromQuerySnapshot(doc))
        .toList());

    var breadStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => BreadModel.fromQuerySnapshot(doc))
        .toList());

    var iceStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => IceModel.fromQuerySnapshot(doc))
        .toList());

    var shawarmaStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => shawarmaModel.fromQuerySnapshot(doc))
        .toList());

    var promoStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => PromoModel.fromQuerySnapshot(doc))
        .toList());

    var drinkStream = FirebaseFirestore.instance
        .collection("Foods")
        .where("Title", isGreaterThanOrEqualTo: upperCaseQuery)
        .where("Title", isLessThan: endString)
        .snapshots()
        .map((QuerySnapshot searchProduct) => searchProduct.docs
        .map((doc) => DrinkModel.fromQuerySnapshot(doc))
        .toList());

    // Combine all streams
    StreamZip([
      foodStream,
      proteinStream,
      pastryStream,
      cakeStream,
      breadStream,
      iceStream,
      shawarmaStream,
      promoStream,
      drinkStream
    ]).listen((combinedLists) {
      // Combine all results into a single list
      List<dynamic> combinedList = [];
      for (var list in combinedLists) {
        combinedList.addAll(list);
      }

      // Remove duplicates based on a unique identifier
      var uniqueItems = <String, dynamic>{};
      for (var item in combinedList) {
        // Use a unique identifier for each item, e.g., 'id' or 'title'
        var id = item.id; // Change 'id' to the property that uniquely identifies the item
        if (!uniqueItems.containsKey(id)) {
          uniqueItems[id] = item;
        }
      }

      // Update the search results
      _searchResults.value = uniqueItems.values.toList();
    });
  }
}
