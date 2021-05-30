import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:flutter/material.dart';
import '../models/Diary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/DiaryServices.dart';

class DiaryUpdateScreen extends StatefulWidget {
  final String diaryTitle;
  final String diaryBody;
  final String diaryId;
  final String userId;
  DiaryUpdateScreen(this.diaryTitle, this.diaryBody, this.diaryId, this.userId);

  @override
  _DiaryUpdateScreenState createState() => _DiaryUpdateScreenState();
}

class _DiaryUpdateScreenState extends State<DiaryUpdateScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    titleController.text = widget.diaryTitle.toString();
    bodyController.text = widget.diaryBody.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToDiaryPage(widget.userId));
        return;
      },
      child: Scaffold(
        backgroundColor: auxieBlue,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: Center(
              child: Column(
                children: [
                  Column(
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
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        height: 100,
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: auxieWhite,
                              filled: true,
                              hintText: "Enter your note",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          keyboardType: TextInputType.multiline,
                          expands: true,
                          maxLines: null,
                          minLines: null,
                          controller: bodyController,
                        ),
                      )
                    ],
                  ),
                  RaisedButton(
                    color: auxieGreen,
                    child: Center(
                        child: Text("Save",
                            style: plainText.copyWith(color: Colors.white))),
                    onPressed: () async {
                      DiaryServices.diaryCollection.doc(widget.diaryId).update({
                        "title": titleController.text,
                        "body": bodyController.text
                      });
                      context
                          .bloc<PageBloc>()
                          .add(GoToDiaryPage(widget.userId));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
    ;
  }
}
