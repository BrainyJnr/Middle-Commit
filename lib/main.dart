import 'package:amazing/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/authentication_repositories.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();


  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1 ),);
  FlutterNativeSplash.remove();


  // Todo : Add Widgets Binding
  /// --- Getx Local Storage
  await GetStorage.init();
  // Todo : Await Native Splash
  // Todo : Initialize Firebase
 // await Firebase.initializeApp

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  // Todo : Initialize  Authentication

  runApp(const App());
}




