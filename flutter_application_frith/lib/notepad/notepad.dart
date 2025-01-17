import 'package:flutter/material.dart';
import 'notepad_details.dart';
import 'notepad_homepage.dart';

class Notepad {
  String title;
  //String time;
  String date;
  String details;

  Notepad(
      {required this.title,
      //required this.time,
      required this.date,
      required this.details});
}

class NotepadModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Notepad> items = [];

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  NotepadModel() {
    add(Notepad(
        title: "Notepad1",
        //time: "1.00pm",
        date: "2021-05-23 12:00:02.000",
        details: "The first note is ..."));
    add(Notepad(
        title: "Notepad2",
        //time: "2.00pm",
        date: "2021-07-25 12:00:02.000",
        details: "The second note is ..."));
    add(Notepad(
        title: "Notepad3",
        //time: "1.00pm",
        date: "2021-07-20 12:00:02.000",
        details: "The third note is ..."));
    add(Notepad(
        title: "Notepad4",
        //time: "3.30pm",
        date: "2021-04-23 12:00:02.000",
        details: "The 4th note is ..."));
    add(Notepad(
        title: "Notepad5",
        //time: "1.00pm",
        date: "2021-09-23 12:00:02.000",
        details: "The 5th note is ..."));
  }

  void add(Notepad item) {
    items.add(item);
    update();
  }

  void sort() {
    items.sort(
        (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
  }

  void removeAll() {
    items.clear();
    update();
  }

  //update any listeners
  // This call tells the widgets that are listening to this model to rebuild.
  void update() {
    notifyListeners();
  }
}
