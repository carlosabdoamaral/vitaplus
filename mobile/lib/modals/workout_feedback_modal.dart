import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitaplus/models/feedback_model.dart';
import 'package:vitaplus/models/workout_model.dart';
import 'package:vitaplus/pages/home/home_page.dart';

class WorkoutFeedbackModal extends StatefulWidget {
  const WorkoutFeedbackModal({super.key, required this.workout});

  final WorkoutModel workout;

  @override
  State<WorkoutFeedbackModal> createState() => _WorkoutFeedbackModalState();
}

class _WorkoutFeedbackModalState extends State<WorkoutFeedbackModal> {
  var feedbacks = [
    FeedbackModel(
      note: 1,
      icon: Icons.mood_bad_rounded,
      active: false,
      color: Colors.red,
    ),
    FeedbackModel(
      note: 2,
      icon: Icons.sentiment_dissatisfied_rounded,
      active: false,
      color: Colors.deepOrange,
    ),
    FeedbackModel(
      note: 3,
      icon: Icons.sentiment_neutral_rounded,
      active: false,
      color: Colors.orangeAccent,
    ),
    FeedbackModel(
      note: 4,
      icon: Icons.sentiment_satisfied_rounded,
      active: false,
      color: Colors.green,
    ),
    FeedbackModel(
      note: 5,
      icon: Icons.sentiment_very_satisfied_rounded,
      active: false,
      color: Colors.greenAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O QUE VOCÊ ACHOU?",
              style: GoogleFonts.sen(
                fontWeight: FontWeight.w600,
                color: Colors.indigo.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                for (var fb in feedbacks)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          for (var el in feedbacks) {
                            el.active = false;
                          }

                          fb.active = true;
                        });
                      },
                      child: Icon(
                        fb.icon,
                        color:
                            fb.active ? fb.color : Colors.grey.withOpacity(0.3),
                        size: 70,
                      ),
                    ),
                  )
              ],
            ),
            Row(
              children: [
                Text(
                  "Não gostei",
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo.withOpacity(0.6),
                  ),
                ),
                const Spacer(),
                Text(
                  "Gostei muito!",
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  for (var e in widget.workout.exercises) {
                    e.status = 0;
                  }
                });

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Salvar!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sen(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
