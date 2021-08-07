import 'package:flutter/cupertino.dart';

class PassengerModel {
  String id;
  String name;
  String designation;
  String company;
  Map<String, int> fellow = {};

// 1 connected
// 2 requested
// 3 got request

  PassengerModel({
    this.id,
    this.name,
    this.designation,
    this.company,
    this.fellow,
  }) {
    if (fellow == null) {
      this.fellow = {};
    }
  }
}
