import 'package:auth/services/locator.dart';
import 'package:auth/tunnel/entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tunnel/bloc/entrance_deleguate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  BlocSupervisor.delegate = EntranceDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Entrance(),
    );
  }
}
