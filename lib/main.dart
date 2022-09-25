import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyapp/data_uploader_screen.dart';
import 'package:studyapp/firebase_options.dart';
import 'package:studyapp/routes/app_routes.dart';
import 'package:studyapp/screens/introduction.dart';
import 'package:studyapp/screens/splash_screen.dart';

import 'binding/initial_binding.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
//   runApp( GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: DataUploaderScreen(),
//   //
//
//   ));
// }

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();
runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    getPages:
      AppRoutes().routes(),

    );
  }
}

