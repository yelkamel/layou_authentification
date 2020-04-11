import 'package:flutter/material.dart';

import '../../../model/login.dart';

class EmailStep extends StatelessWidget {
  final LoginModel model;

  const EmailStep({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onEditingComplete: model.submitEmail,
        ),
        RaisedButton(
          onPressed: model.submitEmail,
          child: Text("Connexion"),
        ),
      ],
    );
  }
}
