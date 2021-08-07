import 'package:task/Models/demoData.dart';
import 'package:task/Screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<DemoData>(
        create: (_) => DemoData(),
        child: Wrapper(),
      ),
    );
  }
}
