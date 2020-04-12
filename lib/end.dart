import 'package:auth/button/logout_button.dart';
import 'package:flutter/material.dart';

class TunnelEnd extends StatelessWidget {
  final String userEmail;

  const TunnelEnd({Key key, this.userEmail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userEmail),
        actions: <Widget>[LogoutButton()],
      ),
      backgroundColor: Colors.amber,
    );
  }
}
