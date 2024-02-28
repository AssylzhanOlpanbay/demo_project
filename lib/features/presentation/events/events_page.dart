
import 'package:demo_practice/core/resources/models.dart';
import 'package:demo_practice/features/presentation/events/events_details.dart';
import 'package:demo_practice/features/presentation/events/components/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    eventProvider.init();
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "Event LIst",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: const Text(
                    'All/',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {
                    eventProvider.sortEvent('');
                    // Navigator.pop(context);
                  },
                ),
                InkWell(
                  child: const Text(
                    'Unread/',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {
                    eventProvider.sortEvent('false');
                    // Navigator.pop(context);
                  },
                ),
                InkWell(
                  child: const Text(
                    'Read',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {
                    eventProvider.sortEvent('true');
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
            Consumer<EventProvider>(
              builder: (context, data, child) {
                return Expanded(
                  child: data.events.isNotEmpty
                      ? EventList(eventList: data.events)
                      : const Center(
                          child: Text("Not data"),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  List<EventA> eventList = [];
  EventList({super.key, required this.eventList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: eventList.length,
      itemBuilder: (context, index) {
        EventA user = eventList[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventDetails(
                  event: eventList[index],
                ),
              ),
            );
          },
          leading: Image.asset("assets/images/${user.eventPictures[0]}"),
          title: Text(user.eventTitle),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.eventText),
              Text(
                user.eventReadStatus == true ? "Read" : "Unread",
                style: TextStyle(
                    color: user.eventReadStatus == true
                        ? Colors.green
                        : Colors.red),
              ),
            ],
          ),
        );
      },
    );
  }
}