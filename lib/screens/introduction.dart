import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyapp/widgets/app_circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:Get.width*0.1),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star,size: 65,color: Colors.amber,),
              const Text("This is Study App ...This is Study App ...This is Study App ...This is Study App ...This is Study App ...This is Study App ...This is Study App ...This is Study App ...This is Study App ...This is Study App ..."),
              AppCircleButton(child: Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
      ),
    );
  }
}
