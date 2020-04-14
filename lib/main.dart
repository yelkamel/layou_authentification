import 'package:auth/start.dart';
import 'package:auth/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/deleguate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Blocker l'orientation vertical
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Navigation color change
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.deepOrange,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  setupLocator();
  BlocSupervisor.delegate = EntranceDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La You Boarding 😁',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TunnelStart(),
    );
  }
}
