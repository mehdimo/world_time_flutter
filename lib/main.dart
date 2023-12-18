import 'package:flutter/material.dart';
import 'package:world_time_flutter/pages/choose-location.dart';
import 'package:world_time_flutter/pages/loading.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
