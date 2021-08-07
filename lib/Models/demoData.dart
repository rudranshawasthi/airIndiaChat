import 'package:flutter/cupertino.dart';
import 'package:task/Models/Passanger.dart';

class DemoData extends ChangeNotifier {
  PassengerModel _currentUser;

  PassengerModel get currentUser => _currentUser;

  String chatWith;
  // List<PassengerModel> demo;

  Map<String, PassengerModel> data;

  void initaize() {
    _currentUser = PassengerModel(
      id: '0',
      name: 'Rudransh',
      designation: 'Aspiring Intern',
      company: 'teach2educate',
    );
    data = {};
    data['1'] = (PassengerModel(
      id: "1",
      name: 'Avi',
      designation: 'Developer',
      company: 'teach2educate',
    ));
    data['2'] = (PassengerModel(
      id: "2",
      name: 'Rohan',
      designation: 'Intern',
      company: 'ASbv',
    ));
    data['3'] = (PassengerModel(
      id: "3",
      name: 'Rakesh',
      designation: 'CEO',
      company: 'deledsa',
    ));
    data['4'] = (PassengerModel(
      id: "4",
      name: 'Shirish',
      designation: 'SDE1',
      company: 'teach2educate',
    ));
    data['5'] = (PassengerModel(
      id: "5",
      name: 'Sagnik',
      designation: 'Full Stack',
      company: 'WHF',
    ));
    data['6'] = (PassengerModel(
      id: "6",
      name: 'Adil',
      designation: 'SDE',
      company: 'abxs',
    ));
    data['7'] = (PassengerModel(
      id: "7",
      name: 'Notion',
      designation: 'CAs Intern',
      company: 'dsate',
    ));
    data['8'] = (PassengerModel(
      id: "8",
      name: 'Workseer',
      designation: 'SCS',
      company: 'sadte',
    ));
    data['9'] = (PassengerModel(
      id: "9",
      name: 'Palak',
      designation: 'CFO',
      company: 'HIW',
    ));
    data['10'] = (PassengerModel(
      id: "10",
      name: 'Jhanvi',
      designation: 'Aspiring Intern',
      company: 'teach2educate',
    ));
    // print("Data: $data");
    data['3'].fellow['0'] = 1;
    currentUser.fellow['3'] = 1;
    data['4'].fellow['0'] = 3;
    currentUser.fellow['4'] = 2;
    data['6'].fellow['0'] = 2;
    currentUser.fellow['6'] = 3;
    data['9'].fellow['0'] = 1;
    currentUser.fellow['9'] = 1;
  }

  void requestConnection(String id) {
    _currentUser.fellow[id] = 3;
    data[id].fellow[currentUser.id] = 2;
    print("requested connection successfuly with ${id}");
    notifyListeners();
  }

  void rejectRequest(String id) {
    _currentUser.fellow[id] = 0;
    data[id].fellow[currentUser.id] = 0;
    print(
        "${currentUser.name} rejected requested connection successfuly with ${data[id].name}");
    notifyListeners();
  }

  void undoRequest(String id) {
    _currentUser.fellow[id] = 0;
    data[id].fellow[currentUser.id] = 0;
    print(
        "${currentUser.name} Removed connection successfuly with ${data[id].name}");
    notifyListeners();
  }

  void acceptRequest(String id) {
    _currentUser.fellow[id] = 1;
    data[id].fellow[currentUser.id] = 1;
    print(
        "${currentUser.name} accepted requested connection successfuly with ${data[id].name}");
    notifyListeners();
  }

  void chatWithUser(String id) {
    chatWith = id;
    notifyListeners();
  }
}
