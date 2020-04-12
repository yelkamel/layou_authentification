import 'package:auth/bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntranceController {
  static getUserEmail(BuildContext context) {
    return Text(BlocProvider.of<EntranceBloc>(context).userCongitoEmail);
  }
}
