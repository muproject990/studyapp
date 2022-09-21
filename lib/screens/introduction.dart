import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/widgets/app_circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Icon(Icons.star,size: 65,color: Colors.amber,),
            const Text("This is Study App"),
            // AppCircleButton(),
          ],
        ),
      ),
    );
  }
}
