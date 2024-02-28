import 'package:demo_practice/core/resources/model.dart';
import 'package:demo_practice/core/resources/models.dart';
import 'package:flutter/cupertino.dart';


class EventProvider extends ChangeNotifier {
  List<EventA> testList = [];
  List<EventA> foundList = [];

  void init() {
    testList = eventList;
    foundList = eventList;
  }

  List<EventA> get events => foundList;

  void sortEvent(String enteredKeyword) {
    List<EventA> results = [];
    if (enteredKeyword.toLowerCase().contains("true")) {
      results = testList
          .where((event) => event.eventReadStatus
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    } else if (enteredKeyword.toLowerCase().contains("false")) {
      results = testList
          .where((event) => event.eventReadStatus
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    } else {
      results = testList;
    }
    foundList = results;
    notifyListeners();
  }
}