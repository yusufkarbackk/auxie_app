import 'package:cloud_firestore/cloud_firestore.dart';
import "../models/Diary.dart";

class DiaryServices {
  static CollectionReference diaryCollection =
      FirebaseFirestore.instance.collection("diaries");

  static DocumentReference doc_ref =
      FirebaseFirestore.instance.collection("diaries").doc();

  static Future<void> createDiary(Diary diary) async {
    await diaryCollection.add(
        {"userId": diary.userId, "title": diary.title, "body": diary.body});
  }

  static Future<void> updateDiary(
      String diaryTitle, String diaryBody, String diaryId) async {
    await diaryCollection
        .doc(diaryId)
        .set({"title": diaryTitle, "body": diaryBody});
  }

  static deleteDiary(String diaryId) async {
    await diaryCollection.doc(diaryId).delete();
  }

  static Stream<QuerySnapshot> getDiaries(String id) {
    Stream<QuerySnapshot> snapshots =
        diaryCollection.where("userId", isEqualTo: id).snapshots();

    return snapshots;
  }

  static Stream<DocumentSnapshot> getOneDiary(String id) {
    Stream<DocumentSnapshot> snapshot = diaryCollection.doc(id).snapshots();
    return snapshot;
  }
}
