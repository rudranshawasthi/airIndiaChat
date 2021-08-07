import 'package:flutter/material.dart';
import 'package:task/Models/demoData.dart';
import 'package:task/Widgets/passengerCard.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print("Current user :  ${context.read<DemoData>().currentUser.fellow}");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Co-passengers in your vicinity",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            if (context
                .read<DemoData>()
                .data['${index + 1}']
                .fellow
                .containsKey('0')) {
              print(
                  "here ++ ${context.read<DemoData>().data['${index + 1}'].fellow['0']} ++ ");
            }
            return PassengerCard(
                passenger: context.read<DemoData>().data['${index + 1}']);
          },
          itemCount: context.read<DemoData>().data.length,
        ));
  }
}
