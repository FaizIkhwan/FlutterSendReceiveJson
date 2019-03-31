import 'package:flutter/material.dart';
import 'package:send_receive_json/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Send and receive json",
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}
