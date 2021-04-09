import 'package:flutter/material.dart';
import '../shared/SharedStyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc/bloc.dart';

class WebinarBanner extends StatelessWidget {
  final String event;
  final String date;
  final String desc;

  WebinarBanner({this.event, this.date, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      //quotes
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: auxieBlue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event,
            style: titledText.copyWith(
                color: Color(0xFFf4f1de), fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(desc, style: plainText.copyWith(color: Color(0xFFf4f1de))),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.date_range_rounded,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: 15),
              Text(date, style: plainText.copyWith(color: Color(0xFFf4f1de))),
            ],
          ),
        ],
      ),
    );
  }
}
