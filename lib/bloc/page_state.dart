part of 'page_bloc.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class OnInitialPage extends PageState {}

class OnSplashPage extends PageState {}

class OnMainPage extends PageState {
  final String id;

  OnMainPage({this.id});
}

class OnSignUpPage extends PageState {}

class OnSignInPage extends PageState {}

class OnDiaryPage extends PageState {
  final String id;

  OnDiaryPage({this.id});
}

class OnDiaryAddPage extends PageState {
  final String id;

  OnDiaryAddPage({this.id});
}

class OnDiaryUpdatepage extends PageState {
  final String diaryTitle;
  final String diaryBody;
  final String diaryId;
  final String userId;

  OnDiaryUpdatepage(
      {this.diaryTitle, this.diaryBody, this.diaryId, this.userId});
}

class OnDiaryShowPage extends PageState {
  final String diaryId;
  final String userId;

  OnDiaryShowPage(this.diaryId, this.userId);
}

class OnCalmYourselfPage extends PageState {
  final String id;

  OnCalmYourselfPage(this.id);
}

class OnProfilePage extends PageState {
  final String id;

  OnProfilePage(this.id);
}
