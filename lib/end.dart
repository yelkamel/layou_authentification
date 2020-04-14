import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/index.dart';
import 'widget/logout_button.dart';

class TunnelEnd extends StatelessWidget {
  final String userEmail;
  final Widget child;
  const TunnelEnd({Key key, this.userEmail, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BlocProvider.of<EntranceBloc>(context).userCongitoEmail),
        actions: <Widget>[LogoutButton()],
      ),
      backgroundColor: Colors.amber,
      body: Center(
        child: Text('Utilisateur connecté 😃'),
      ),
    );
  }
}
