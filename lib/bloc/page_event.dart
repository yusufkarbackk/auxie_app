part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}

class GoToSplashPage extends PageEvent {}

class GoToMainPage extends PageEvent {}

class GoToSignUpPage extends PageEvent {}

class GoToSignInPage extends PageEvent {}

class GoToDiaryPage extends PageEvent {}

class GoToDiaryAddPage extends PageEvent {
  final String id;

  GoToDiaryAddPage({this.id});
}
