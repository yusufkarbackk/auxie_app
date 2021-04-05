import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'DiaryScreen.dart';
import '../models/Diary.dart';

class DiaryAddScreen extends StatefulWidget {
  final String id;

  DiaryAddScreen({this.id});

  @override
  _DiaryAddScreenState createState() => _DiaryAddScreenState();
}

class _DiaryAddScreenState extends State<DiaryAddScreen> {
  CollectionReference notes = FirebaseFirestore.instance.collection("notes");
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: auxieWhite,
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: "Enter your note title",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          fillColor: Colors.white,
                          filled: true)),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your note",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    keyboardType: TextInputType.multiline,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    controller: bodyController,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Diary diary = Diary(
                      userId: 
                    );
                  },
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
