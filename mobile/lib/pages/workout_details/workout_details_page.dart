import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitaplus/models/workout_model.dart';
import 'package:vitaplus/pages/home/home_page.dart';
import 'package:vitaplus/utils/color_utils.dart';
import 'package:vitaplus/utils/colors.dart';

class WorkoutDetailsPage extends StatefulWidget {
  const WorkoutDetailsPage({super.key, required this.workout});

  final WorkoutModel workout;

  @override
  State<WorkoutDetailsPage> createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  bool workoutDidStart = false;
  bool canFinishWorkout = false;
  int currentExerciseIndex = 0;

  WorkoutModel? workoutModel;

  void resetWorkout() {
    setState(() {
      for (var e in workoutModel!.exercises) {
        e.status = 0;
      }
    });
  }

  void startWorkout() {
    setState(() {
      workoutDidStart = true;
      canFinishWorkout = false;
      currentExerciseIndex = 0;
      workoutModel?.exercises[currentExerciseIndex].status = 1;
    });
  }

  void finishWorkout() {
    nextExercise();
    resetWorkout();
    Navigator.pop(context);
    // Handle finish
    // ...
  }

  void nextExercise() {
    setState(() {
      workoutModel?.exercises[currentExerciseIndex].status = 2;

      if (currentExerciseIndex < workoutModel!.exercises.length - 1) {
        updateExerciseStatus(currentExerciseIndex + 1, 1);
      }
    });
  }

  void prevExercise() {
    setState(() {
      workoutModel?.exercises[currentExerciseIndex].status = 0;

      if (currentExerciseIndex > 0) {
        updateExerciseStatus(currentExerciseIndex - 1, 1);
      }
    });
  }

  void updateExerciseStatus(index, newStatus) {
    if (workoutDidStart) {
      setState(() {
        currentExerciseIndex = index;

        // DESABILITA OS EXERCÍCIOS EM ANDAMENTO
        for (var e in workoutModel!.exercises) {
          if (e.status == 1) {
            e.status = 0;
          }
        }

        // ATUALIZA O STATUS DO EXERCÍCIO
        if ([0, 1, 2].contains(newStatus)) {
          workoutModel?.exercises[index].status = newStatus;
        } else {
          workoutModel?.exercises[index].status = 0;
        }

        // VALIDA SE PODE CONCLUIR O TREINO
        if (workoutModel?.exercises != null) {
          int completedExercisesCount = workoutModel!.exercises
              .where((exercise) => exercise.status == 2)
              .length;

          bool allExercisesDone =
              completedExercisesCount >= (workoutModel!.exercises.length - 1);

          canFinishWorkout = allExercisesDone;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      workoutModel = widget.workout;
    });
  }

  @override
  Widget build(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.height * 0.45;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // BANNER
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      workoutDidStart
                          ? widget.workout.exercises[currentExerciseIndex]
                              .bannerImage
                          : widget.workout.bannerImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: imageHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.indigo,
                            Colors.indigo.withOpacity(0),
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Text(
                        workoutDidStart
                            ? widget
                                .workout.exercises[currentExerciseIndex].name
                            : widget.workout.name,
                        style: GoogleFonts.sen(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              resetWorkout();
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          const Spacer(),
                          if (workoutDidStart == true &&
                              canFinishWorkout == false)
                            GestureDetector(
                              onTap: () {
                                finishWorkout();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.stop_rounded,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          if (canFinishWorkout == true)
                            GestureDetector(
                              onTap: () {
                                finishWorkout();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.military_tech_rounded,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              // EXERCÍCIOS
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "EXERCÍCIOS",
                          style: GoogleFonts.sen(
                            fontWeight: FontWeight.w600,
                            color: blueDark.withOpacity(0.6),
                          ),
                        ),
                      ),
                      for (var i = 0; i < workoutModel!.exercises.length; i++)
                        GestureDetector(
                          onTap: () {
                            updateExerciseStatus(i, 1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 20,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                color: workoutModel!.exercises[i].status == 1
                                    ? Colors.indigo
                                    : Colors.transparent,
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                if (widget.workout.exercises[i].status == 0)
                                  const Icon(
                                    Icons.circle_outlined,
                                    color: Colors.redAccent,
                                    size: 35,
                                  ),
                                if (widget.workout.exercises[i].status == 1)
                                  GestureDetector(
                                    onTap: () {
                                      updateExerciseStatus(i, 2);
                                    },
                                    child: const Icon(
                                      Icons.circle,
                                      size: 35,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                if (widget.workout.exercises[i].status == 2)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.greenAccent,
                                    size: 35,
                                  ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.workout.exercises[i].name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        widget.workout.exercises[i].description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      SingleChildScrollView(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text(
                                              "${workoutModel!.exercises[i].sets} séries",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Text(
                                              "${workoutModel!.exercises[i].reps} repetições",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
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
                        ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (workoutDidStart == false)
            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      startWorkout();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.3,
                      ),
                      child: Text(
                        "Iniciar",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sen(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (workoutDidStart == true)
            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (currentExerciseIndex > 0)
                        GestureDetector(
                          onTap: () {
                            prevExercise();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 178, 189, 255),
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      const SizedBox(width: 10),
                      if (currentExerciseIndex <
                          workoutModel!.exercises.length - 1)
                        GestureDetector(
                          onTap: () {
                            nextExercise();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 178, 189, 255),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
