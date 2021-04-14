import 'package:flutter/material.dart';
import '../shared/SharedStyle.dart';
import '../models/Diary.dart';

class DiaryCard extends StatelessWidget {
  final String title;
  final String body;
  final Function onEdit;
  final Function onDelete;

  DiaryCard({this.title, this.body, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
          color: auxieBlue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: titledText.copyWith(color: auxieWhite),
            maxLines: 5,
            overflow: TextOverflow.ellipsis),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            child: Text(
              body,
              style: plainText.copyWith(color: auxieWhite),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
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
              child: Icon(Icons.edit, color: auxieOrange, size: 30),
            ),
            SizedBox(width: 15),
            GestureDetector(
                onTap: () {
                  if (onDelete != null) {
                    onDelete();
                  }
                },
                child: Container(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.delete,
                      color: auxieOrange,
                      size: 30,
                    )))
          ],
        )
      ]),
    );
  }
}
