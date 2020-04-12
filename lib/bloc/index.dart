import 'package:auth/services/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';

import 'event.dart';
import 'state.dart';

GetIt locator = GetIt.instance;

class EntranceBloc extends Bloc<EntranceEvent, EntranceState> {
  final Auth auth = locator.get<Auth>();

  @override
  EntranceState get initialState => EntranceInitial();

  @override
  Stream<EntranceState> mapEventToState(
    EntranceEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* mapAppStartedToState();
    }
    if (event is LoggedIn) {
      yield* mapLoginToState(event);
    }
    if (event is LoggedOut) {
      yield* mapLogOutToState();
    }
  }

  Stream<EntranceState> mapAppStartedToState() async* {
    final email = await auth.init();

    print('username $email');
    if (email != null) {
      yield EntranceEnd(email: email);
      return;
    }

    yield LoginStep();
  }

  Stream<EntranceState> mapLoginToState(LoggedIn event) async* {
    yield EntranceEnd(email: event.email);
  }

  Stream<EntranceState> mapLogOutToState() async* {
    await auth.signOut();
    yield LoginStep();
  }
}
