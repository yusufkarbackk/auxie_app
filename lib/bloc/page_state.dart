part of 'page_bloc.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class OnInitialPage extends PageState {}

class OnSplashPage extends PageState {}

class OnMainPage extends PageState {}

class OnSignUpPage extends PageState {}

class OnSignInPage extends PageState {}
