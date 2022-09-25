import 'package:get/get.dart';
import 'package:studyapp/screens/introduction.dart';
import 'package:studyapp/screens/splash_screen.dart';

class AppRoutes{
  routes()=> [
    GetPage(name: '/', page:() => const SplashScreen()),
    GetPage(name: '/introduction', page:() => const AppIntroductionScreen()),



    ];


}