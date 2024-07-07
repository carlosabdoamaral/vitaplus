import 'package:flutter/material.dart';
import 'package:vitaplus/models/workout_model.dart';
import 'package:vitaplus/pages/workout_details/workout_details_page.dart';

class WorkoutItemWidget extends StatefulWidget {
  const WorkoutItemWidget({super.key, required this.workout});

  final WorkoutModel workout;

  @override
  State<WorkoutItemWidget> createState() => _WorkoutItemWidgetState();
}

class _WorkoutItemWidgetState extends State<WorkoutItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutDetailsPage(workout: widget.workout),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5,
              )
            ]),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.workout.bannerImage,
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.workout.name,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              "${widget.workout.durationInMinutes} min",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 25),
                        Row(
                          children: [
                            Icon(
                              Icons.bolt_rounded,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              widget.workout.category,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
