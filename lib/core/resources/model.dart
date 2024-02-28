
import 'package:demo_practice/core/resources/data.dart';
import 'package:demo_practice/core/resources/models.dart';



List<EventA> eventList = events.map(
  (eventData) {
    return EventA(
      eventId: eventData['eventId'],
      eventTitle: eventData['eventTitle'],
      eventText: eventData['eventText'],
      eventReadStatus: eventData['eventReadStatus'],
      eventPictures: eventData['eventPictures'],
    );
  },
).toList();