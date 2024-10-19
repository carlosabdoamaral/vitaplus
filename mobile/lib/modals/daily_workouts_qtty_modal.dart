import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitaplus/data/workout_data.dart';
import 'package:vitaplus/db/workout_historic.dart';
import 'package:vitaplus/main.dart';
import 'package:vitaplus/models/workout_model.dart';
import 'package:vitaplus/utils/colors.dart';

class DailyWorkoutsQttyModal extends StatefulWidget {
  const DailyWorkoutsQttyModal({super.key});

  @override
  State<DailyWorkoutsQttyModal> createState() => _DailyWorkoutsQttyModalState();
}

class _DailyWorkoutsQttyModalState extends State<DailyWorkoutsQttyModal> {
  List<WorkoutHistoric> historic = workoutHistoricNotifier.getHistoric;

  WorkoutModel getWorkoutById(int? id) {
    return workoutData.firstWhere((element) => element.id == id);
  }

  void updateHistoric() {
    setState(() {
      historic = workoutHistoricNotifier.getHistoric;
    });
  }

  @override
  void initState() {
    workoutHistoricNotifier.addListener(() {
      updateHistoric();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Treino",
            style: GoogleFonts.sen(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: blue,
            ),
          ),
          for (var w in historic)
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(13)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getWorkoutById(w.id).category),
                  Text(w.createdAt.toIso8601String()),
                ],
              ),
            )
        ],
      ),
    );
  }
}
