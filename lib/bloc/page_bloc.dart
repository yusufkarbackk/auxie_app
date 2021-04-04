import 'dart:async';

import 'package:auxie_app/models/RegistrationData.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/RegistrationData.dart';

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
      yield OnMainPage();
    } else if (event is GoToSignUpPage) {
      yield OnSignUpPage();
    } else if (event is GoToSignInPage) {
      yield OnSignInPage();
    }
  }
}