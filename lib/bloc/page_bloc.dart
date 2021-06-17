import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage(id: event.id);
    } else if (event is GoToSignUpPage) {
      yield OnSignUpPage();
    } else if (event is GoToSignInPage) {
      yield OnSignInPage();
    } else if (event is GoToDiaryPage) {
      yield OnDiaryPage(id: event.id);
    } else if (event is GoToDiaryAddPage) {
      yield OnDiaryAddPage(id: event.id);
    } else if (event is GoToDiaryUpdatePage) {
      yield OnDiaryUpdatepage(
          diaryTitle: event.diaryTitle,
          diaryBody: event.diaryBody,
          diaryId: event.diaryId,
          userId: event.userId);
    } else if (event is GoToDiaryShowPage) {
      yield OnDiaryShowPage(event.diaryId, event.userId);
    } else if (event is GoToCalmYourselfPage) {
      yield OnCalmYourselfPage(event.id);
    } else if (event is GoToProfilePage) {
      yield OnProfilePage(event.id);
    } else if (event is GoToDisscusionPage) {
      yield OnDisscusionPage();
    }
  }
}
