import 'package:cloud_firestore/cloud_firestore.dart';
import "../models/Diary.dart";

class DiaryServices {
  static CollectionReference diaryCollection =
      FirebaseFirestore.instance.collection("diaries");

  static Future<void> createDiary(Diary diary) async {
    await diaryCollection.add(
        {"userId": diary.userId, "title": diary.title, "body": diary.body});
  }

  static Future<void> updateDiary(Diary diary) async {
    QuerySnapshot snapshot = await diaryCollection.get();
    await diaryCollection.doc().update({});
  }

  static Future<void> deleteDiary(String id) async {
    diaryCollection.doc(id).delete();
  }

  static Future<List<Diary>> getDiaries(String id) async {
    QuerySnapshot snapshot = await diaryCollection.get();

    var documents =
        snapshot.docs.where((document) => document.data()["userId"] == id);

    List<Diary> diaries = [];

    for (var document in documents) {
      diaries.add(Diary(
          body: document.data()["body"],
          title: document.data()["title"],
          userId: document.data()["userId"]));
    }

    return diaries;
  }
}
