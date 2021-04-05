import 'dart:async';

import 'package:auxie_app/services/UserServices.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/User.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      User user = await UserServices.getUser(event.id);
      yield UserLoaded(user: user);
    }
  }
}
