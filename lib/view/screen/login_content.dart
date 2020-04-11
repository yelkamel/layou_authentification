import 'dart:async';

import 'package:auth/model/login.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginContent extends HookWidget {
  final LoginModel model;

  LoginContent({this.model});

  void createSnackBar(BuildContext context, String message) {
    Flushbar(
      duration: Duration(seconds: 3),
      title: 'Petit soucis',
      message: message,
      flushbarStyle: FlushbarStyle.GROUNDED,
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        scheduleMicrotask(() {
          if (model.error == LoginError.InvalidFormatEmail)
            createSnackBar(context, "Bad Email TA MERE ");
          if (model.error == LoginError.InvalidCode)
            createSnackBar(context, "Bad Code TA MERE ");
        });
        return null;
      },
      [model.error],
    );

    if (model.state == LoginState.NeedCode) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(model.email),
          TextFormField(
            textAlign: TextAlign.center,
            controller: model.controller,
            decoration: InputDecoration(
              hintText: 'Code',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onEditingComplete: () => model.submitCode(),
          ),
          RaisedButton(
            onPressed: () => model.submitCode(),
            child: Text("Vérifier"),
          ),
          RaisedButton(
            onPressed: () => model.back(),
            child: Text("Retour"),
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          textAlign: TextAlign.center,
          controller: model.controller,
          decoration: InputDecoration(
            hintText: 'Email',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onEditingComplete: () => model.submitEmail(),
        ),
        RaisedButton(
          onPressed: () => model.submitEmail(),
          child: Text("Connexion"),
        ),
      ],
    );
  }
}
