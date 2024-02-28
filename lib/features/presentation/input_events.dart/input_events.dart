import 'package:demo_practice/core/resources/data.dart';
import 'package:flutter/material.dart';

class InputEvents extends StatelessWidget {
  // final Event eventList;
  // InputEvents(this.eventList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 20),
      child: Column(
        children: [
          Text("Events Detail", style: TextStyle(fontSize: 35),),
          SizedBox(height: 20),
          // Text(eventList.eventText, style: TextStyle(fontSize: 25),),
          SizedBox(height: 5),
          Text("view counts", style: TextStyle(fontSize: 15),),
          Row(
            children: [
              // Image.asset(eventList.photo1),
              // Image.asset(eventList.photo2),
              // Image.asset(eventList.photo3),
            ],
          )
        ],
      ),
    );
  }
}