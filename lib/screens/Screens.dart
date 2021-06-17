import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:auxie_app/widgets/DiscussionContent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:auxie_app/services/DiscussionServices.dart';
import 'package:auxie_app/models/DiscussionModel.dart';

part 'DiscussionScreen.dart';
part 'DiscussionAddScreen.dart';
