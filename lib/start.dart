import 'package:auth/subapp/login/index.dart';
import 'package:auth/subapp/login/model.dart';
import 'package:auth/subapp/splashscreen/splashscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/index.dart';
import 'bloc/state.dart';
import 'bloc/event.dart';
import 'end.dart';

class TunnelStart extends StatelessWidget {
  @override
  Widget build(BuildContext contect) {
    // Tout les écrans de bloc tunnel doivent avoir un onSuccess (et peut etre des exits par fois)
    // Idée faire des A/B test facile et robuste.
    // Drive le tunnel en fonction de donnée Firebase 😉

    return BlocProvider(
      create: (context) => EntranceBloc()..add(AppStarted()),
      child: Scaffold(
        body: BlocBuilder<EntranceBloc, EntranceState>(
          builder: (context, state) {
            if (state is LoginStep) {
              return ChangeNotifierProvider<LoginModel>(
                create: (_) => LoginModel(onSuccess: (String email) {
                  print("email $email");
                  BlocProvider.of<EntranceBloc>(context).add(
                    LoggedIn(email: email),
                  );
                }),
                child: LoginScreen(),
              );
            }
            if (state is EntranceEnd) {
              return TunnelEnd(userEmail: state.email);
            }
            return Splashscreen();
          },
        ),
      ),
    );
  }
}
