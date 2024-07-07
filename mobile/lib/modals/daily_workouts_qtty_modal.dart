import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitaplus/utils/colors.dart';

class DailyWorkoutsQttyModal extends StatefulWidget {
  const DailyWorkoutsQttyModal({super.key});

  @override
  State<DailyWorkoutsQttyModal> createState() =>
      _DailyWorkoutsQttyModalState();
}

class _DailyWorkoutsQttyModalState extends State<DailyWorkoutsQttyModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      padding: EdgeInsets.all(20),
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
          Text(
            "...",
            style: GoogleFonts.sen(
              fontWeight: FontWeight.w500,
              fontSize: 50,
              color: blue,
            ),
          )
        ],
      ),
    );
  }
}
