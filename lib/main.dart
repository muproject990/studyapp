import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyapp/data_uploader_screen.dart';
import 'package:studyapp/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: DataUploaderScreen(),
  //
    sfasfas

  ));
}
