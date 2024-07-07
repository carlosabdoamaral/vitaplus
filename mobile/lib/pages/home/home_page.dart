import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitaplus/data/quotes_data.dart';
import 'package:vitaplus/modals/daily_workouts_qtty_modal.dart';
import 'package:vitaplus/modals/daily_workouts_time_modal.dart';
import 'package:vitaplus/pages/home/home_shortcuts_widget.dart';
import 'package:vitaplus/pages/home/searchbar_widget.dart';
import 'package:vitaplus/utils/colors.dart';
import 'package:vitaplus/data/workout_data.dart';
import 'package:vitaplus/widgets/dashboard_item_widget.dart';
import 'package:vitaplus/widgets/motivacional_quote_widget.dart';
import 'package:vitaplus/widgets/workout_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vita+",
          style: GoogleFonts.sen(
            fontSize: 35,
            fontWeight: FontWeight.w600,
            color: Colors.indigo,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SEARCHBAR
                const SizedBox(height: 10),
                const SearchbarWidget(),

                // QUOTE
                const SizedBox(height: 10),
                MotivacionalQuoteWidget(quote: getRandomQuote()),

                // RESUME
                const SizedBox(height: 10),
                const HomeShortcutsWidget(),

                // WORKOUTS
                const SizedBox(height: 40),
                Text(
                  "O QUE VAMOS FAZER HOJE?",
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.w600,
                    color: blueDark.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 10),
                for (var workout in workoutData)
                  Column(
                    children: [
                      WorkoutItemWidget(workout: workout),
                      const SizedBox(height: 10),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
