part of 'page_bloc.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class OnInitialPage extends PageState {}

class OnSplashPage extends PageState {}

class OnMainPage extends PageState {
  final String id;

  OnMainPage(this.id);
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
  final Diary diary;

  OnDiaryUpdatepage({this.diary});
}
