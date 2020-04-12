import 'package:auth/button/logout_button.dart';
import 'package:flutter/material.dart';

import 'controller/entrance_controller.dart';

class TunnelEnd extends StatelessWidget {
  final String userEmail;
  final Widget child;
  const TunnelEnd({Key key, this.userEmail, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EntranceController.getUserEmail(context),
        actions: <Widget>[LogoutButton()],
      ),
      backgroundColor: Colors.amber,
    );
  }
}
