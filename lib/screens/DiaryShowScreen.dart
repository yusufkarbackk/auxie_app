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
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToDiaryPage(userId));
          return;
        },
        child: Scaffold(
          backgroundColor: auxieWhite,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: ListView(
                children: [
                  StreamBuilder<DocumentSnapshot>(
                      stream: DiaryServices.getOneDiary(diaryId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.data()['title'],
                                  style: titledText.copyWith(fontSize: 26),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(snapshot.data.data()['body'],
                                    style: plainText.copyWith()),
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
