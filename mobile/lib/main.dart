import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitaplus/db/workout_historic.dart';
import 'package:vitaplus/pages/calendar/calendar_page.dart';
import 'package:vitaplus/pages/home/home_page.dart';
import 'package:vitaplus/utils/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class WorkoutHistoricNotifier with ChangeNotifier {
  List<WorkoutHistoric> historic = [];
  List<WorkoutHistoric> get getHistoric => historic;
  void setHistoric(List<WorkoutHistoric> h) {
    historic = h;
    notifyListeners();
  }
}

final workoutHistoricNotifier = WorkoutHistoricNotifier();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VitaPlusApp());
}

class VitaPlusApp extends StatelessWidget {
  const VitaPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vita+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        useMaterial3: true,
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: const Run(),
    );
  }
}

class Run extends StatefulWidget {
  const Run({super.key});

  @override
  _RunState createState() => _RunState();
}

int _currentIndex = 0;

class _RunState extends State<Run> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [
    const HomePage(),
    const CalendarPage(),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.transparent,
        color: Colors.indigo,
        items: const [
          Icon(
            Icons.home_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.calendar_month_rounded,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          changePage(index);
        },
      ),
    );
  }
}
