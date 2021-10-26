import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prototype_sample/view/home/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
