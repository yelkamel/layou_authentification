import 'package:auth/tunnel/bloc/entrance_bloc.dart';
import 'package:auth/tunnel/bloc/entrance_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({Key key, this.email}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              BlocProvider.of<EntranceBloc>(context).add(
                LoggedOut(),
              );
            },
            child: Icon(Icons.all_out),
          )
        ],
      ),
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}
