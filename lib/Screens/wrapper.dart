import 'package:flutter/material.dart';
import 'package:task/Screens/home.dart';
import 'package:task/Screens/chatPage.dart';
import 'package:provider/provider.dart';
import 'package:task/Models/demoData.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    context.read<DemoData>().initaize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/chat': (context) => ChatPage(),
      },
    );
  }
}
