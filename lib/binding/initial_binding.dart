
import 'package:get/get.dart';
import 'package:studyapp/controllers/auth_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController(),permanent:true);
  }
}