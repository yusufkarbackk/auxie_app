import 'package:flutter/material.dart';
import '../shared/SharedStyle.dart';
import '../screens/DiaryUpdateScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Diary.dart';

class DiaryCard extends StatelessWidget {
  final Diary diary;
  final Function onEdit;
  final Function onDelete;

  DiaryCard({this.diary, this.onDelete, this.onEdit});
  CollectionReference notes = FirebaseFirestore.instance.collection("notes");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
          color: auxieGreen,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(diary.title,
            style: titledText.copyWith(color: auxieWhite),
            maxLines: 5,
            overflow: TextOverflow.ellipsis),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Text(
            diary.body,
            style: plainText.copyWith(color: auxieWhite),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  if (onEdit != null) {
                    onEdit();
                  }
                  ;
                },
                child: Icon(Icons.edit)),
            SizedBox(width: 15),
            GestureDetector(
                onTap: () {
                  if (onDelete != null) {
                    onDelete();
                  }
                },
                child: Icon(Icons.delete))
          ],
        )
      ]),
    );
  }
}
