part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}

class GoToSplashPage extends PageEvent {}

class GoToMainPage extends PageEvent {
  final String id;

  GoToMainPage(this.id);
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
  final Diary diary;

  GoToDiaryUpdatePage({this.diary});
}
