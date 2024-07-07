import 'package:flutter/material.dart';
import 'package:vitaplus/modals/daily_workouts_qtty_modal.dart';
import 'package:vitaplus/modals/daily_workouts_time_modal.dart';
import 'package:vitaplus/utils/colors.dart';
import 'package:vitaplus/widgets/dashboard_item_widget.dart';

class HomeShortcutsWidget extends StatefulWidget {
  const HomeShortcutsWidget({super.key});

  @override
  State<HomeShortcutsWidget> createState() => _HomeShortcutsWidgetState();
}

class _HomeShortcutsWidgetState extends State<HomeShortcutsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DashboardItemWidget(
          icon: Icons.sports_gymnastics_rounded,
          label: "TREINO",
          value: "5x",
          background: blue,
          foreground: Colors.white,
          margin: const EdgeInsets.only(right: 5),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const DailyWorkoutsQttyModal();
              },
              isScrollControlled: true,
              enableDrag: true,
              backgroundColor: Colors.transparent,
            );
          },
        ),
        DashboardItemWidget(
          icon: Icons.timer,
          label: "TEMPO",
          value: "15m",
          background: Colors.lightBlue,
          foreground: Colors.white,
          margin: EdgeInsets.only(left: 5),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const DailyWorkoutsTimeModal();
              },
              isScrollControlled: true,
              enableDrag: true,
              backgroundColor: Colors.transparent,
            );
          },
        ),
      ],
    );
  }
}
