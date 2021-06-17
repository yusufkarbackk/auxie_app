part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}

class GoToSplashPage extends PageEvent {}

class GoToMainPage extends PageEvent {
  final String id;

  GoToMainPage({this.id});
}

class GoToSignUpPage extends PageEvent {}

class GoToSignInPage extends PageEvent {}

class GoToDiaryPage extends PageEvent {
  final String id;

  GoToDiaryPage(this.id);
}

class GoToDiaryAddPage extends PageEvent {
  final String id;

  GoToDiaryAddPage({this.id});
}

class GoToDiaryUpdatePage extends PageEvent {
  final String diaryTitle;
  final String diaryBody;
  final String diaryId;
  final String userId;

  GoToDiaryUpdatePage(
      {this.diaryTitle, this.diaryBody, this.diaryId, this.userId});
}

class GoToDiaryShowPage extends PageEvent {
  final String diaryId;
  final String userId;

  GoToDiaryShowPage(this.diaryId, this.userId);
}

class GoToCalmYourselfPage extends PageEvent {
  final String id;

  GoToCalmYourselfPage(this.id);
}

class GoToProfilePage extends PageEvent {
  final String id;

  GoToProfilePage(this.id);
}

class GoToDisscusionPage extends PageEvent {}
