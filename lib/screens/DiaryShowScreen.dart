import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blocs.dart';
import '../shared/SharedStyle.dart';
import '../services/DiaryServices.dart';

class DiaryShowScreen extends StatelessWidget {
  final String diaryId;
  final String userId;

  DiaryShowScreen(this.diaryId, this.userId);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToDiaryPage(userId));
          return;
        },
        child: Scaffold(
          backgroundColor: auxieWhite,
          body: SafeArea(
            child: Container(
              child: ListView(
                children: [
                  StreamBuilder<DocumentSnapshot>(
                      stream: DiaryServices.getOneDiary(diaryId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(children: [
                            Text(snapshot.data.data()['title']),
                            Text(snapshot.data.data()['body']),
                          ]);
                        }
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
