import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:vitaplus/data/schedule_data.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final EventController _eventController = EventController();

  @override
  void initState() {
    super.initState();
    _eventController.addAll(scheduledEvents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calendário",
          style: GoogleFonts.sen(
            color: Colors.indigo,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.view_week_rounded,
                    color: Colors.indigo,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.add,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: DayView(
          backgroundColor: Colors.white,
          controller: _eventController,
          eventTileBuilder: (date, events, boundry, start, end) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(2.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        events.first.title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.sen(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        events.first.description ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.sen(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          fullDayEventBuilder: (events, date) {
            return Container();
          },
          showVerticalLine: true,
          showLiveTimeLineInAllDays: true,
          minDay: DateTime(1990),
          maxDay: DateTime(2050),
          initialDay: DateTime.now(),
          heightPerMinute: 1,
          headerStyle: HeaderStyle(
            leftIcon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.indigo,
            ),
            rightIcon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.indigo,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            headerTextStyle: GoogleFonts.sen(
              color: Colors.indigo,
              fontSize: 18,
            ),
          ),
          eventArranger: const SideEventArranger(),
          onEventTap: (events, date) => print(events),
          onEventDoubleTap: (events, date) => print(events),
          onEventLongTap: (events, date) => print(events),
          onDateLongPress: (date) => print(date),
          startHour: 0,
        ),
      ),
    );
  }
}
