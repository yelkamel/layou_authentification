import 'package:flutter/material.dart';

import '../model.dart';

class CodeStep extends StatelessWidget {
  final LoginModel model;

  const CodeStep({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onEditingComplete: model.submitCode,
        ),
        RaisedButton(
          onPressed: model.submitCode,
          child: Text("Vérifier"),
        ),
        RaisedButton(
          onPressed: model.back,
          child: Text("Retour"),
        ),
      ],
    );
  }
}
