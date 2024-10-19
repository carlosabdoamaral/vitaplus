import 'package:calendar_view/calendar_view.dart';

DateTime get _now => DateTime.now();

final List<CalendarEventData> scheduledEvents = [
  CalendarEventData(
    date: _now,
    title: "Alongamento com Carlos",
    description: "Faça o alongamento diário",
    startTime: DateTime(_now.year, _now.month, _now.day, 08, 00),
    endTime: DateTime(_now.year, _now.month, _now.day, 09, 30),
  ),
];
