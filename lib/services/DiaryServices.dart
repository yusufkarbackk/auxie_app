import 'package:cloud_firestore/cloud_firestore.dart';
import "../models/Diary.dart";

class DiaryServices {
  static CollectionReference diaryCollection =
      FirebaseFirestore.instance.collection("diaries");

  static Future<Diary> createOrUpdateDiary(Diary diary) async {
    diaryCollection.doc(diary.userId).set(
        {"userId": diary.userId, "title": diary.title, "body": diary.body});
  }

  static Future<void> deleteDiary(String id) async {
    diaryCollection.doc(id).delete();
  }
}

