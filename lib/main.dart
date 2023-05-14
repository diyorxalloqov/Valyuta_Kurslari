import 'package:flutter/material.dart';
import 'package:navigating_routing/core/router/router.dart';

void main(List<String> args) {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteList.router.onGenerate,
      theme: ThemeData.dark(),
    );
  }
}
