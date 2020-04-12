import 'package:auth/subapp/login/model.dart';
import 'package:auth/subapp/login/widget/login_hook.dart';
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
