import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studyapp/controllers/questions_paper/questions_paper_model.dart';
import 'package:studyapp/firebase_ref/references.dart';

Future<void> uploadData() async {
final fireStore=FirebaseFirestore.instance;
final manifestContent=await DefaultAssetBundle.of(Get.context!).loadString('AssetManifest.json');

final Map<String,dynamic> manifestMap=json.decode(manifestContent);
final paperInAsset=manifestMap.keys.where((element) => element.startsWith("assets/DB/papers")&&element.contains(".json")).toList();


List<QuestionPaperModel> questionPaper=[];
for(var paper in paperInAsset)
  {
    String stringPaperContent=await rootBundle.loadString(paper);
    //rootbundle contains a information which are packed during application builds
    //to add asset to root bundle add them in the sub sections of a pubspec.yaml file

    questionPaper.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    

  }

var batch=fireStore.batch();

for(var paper in questionPaper){
  batch.set( fireStore.collection("questionPaper").doc(paper.id),{

  //data are
    "title":paper.title,
    "image_url":paper.imageUrl,
    "title":paper.title,

  //

  });
  
  for(var questions in paper.questions!)
    {
      final questionPath=questionRF(paperId: paper.id, questionId: questions.id);
      batch.set(questionPath, {
        "question":questions.question,
        "correct_answer":questions.correctAnswer
      });

      for(var answer in questions.answers!){
        batch.set(questionPath.collection("answers").doc(answer.identifier), {
          "identifier":answer.identifier,
          "answer":answer.answer
        });

      }

    }
  
  
  
  
}







}