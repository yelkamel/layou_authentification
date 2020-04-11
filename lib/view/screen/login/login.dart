import 'package:auth/model/login.dart';
import 'package:auth/view/screen/login/login_hook.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<LoginModel>(
      child: AppBar(
        title: Text('Login'),
      ),
      builder: (context, model, child) {
        return Scaffold(
          appBar: child,
          body: Center(
            child: model.state != LoginState.Loading
                ? LoginHook(model: model)
                : CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
