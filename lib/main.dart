import 'package:flutter/material.dart';
import 'package:prototype_sample/config/app.dart';
import 'config/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  setupStorage();
  runApp(App());
}
