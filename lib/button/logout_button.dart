import 'package:auth/bloc/event.dart';
import 'package:auth/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<EntranceBloc>(context).add(
          LoggedOut(),
        );
      },
      child: Icon(Icons.all_out),
    );
  }
}
