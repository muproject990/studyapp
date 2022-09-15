import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:studyapp/controllers/questions_paper/questions_paper_model.dart';
import 'package:studyapp/firebase_ref/references.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  void uploadData() async {
    final fireStore=FirebaseFirestore.instance;

    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papersInAsset = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();

    List<QuestionPaperModel> questionPapers = [];

    for (var paper in papersInAsset) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    // print("Item no ${questionPapers[0].description}");
    var batch=fireStore.batch();

    for(var paper in questionPapers){
    batch.set(questionPaperRF.doc(paper.id), {
      "title":paper.title,
      "image_url":paper.imageUrl,
      "description":paper.description,
      "questions_count":paper.questions==null?0:paper.questions!.length
    });
    }
await batch.commit();

  }
}
