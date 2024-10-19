
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:vitaplus/models/workout_model.dart';
import 'package:vitaplus/pages/home/home_page.dart';

class ExerciseDetailsPage extends StatefulWidget {
  const ExerciseDetailsPage({super.key, required this.workout});

  final WorkoutModel workout;

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/deadlift.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.pause();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height * 0.6),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                _ControlsOverlay(controller: _controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Deadlift",
                        style:
                            GoogleFonts.sen(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Content
                    Text(
                      "Repetições",
                      style: GoogleFonts.sen(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "10",
                      style: GoogleFonts.sen(
                        fontSize: 80,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "3x séries",
                      style: GoogleFonts.sen(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const Padding(padding: EdgeInsets.only(top: 30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Voltar",
                            style: GoogleFonts.sen(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Próximo",
                            style: GoogleFonts.sen(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        controller.value.isPlaying
            ? const SizedBox.shrink()
            : const ColoredBox(
                color: Colors.black26,
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 100.0,
                    semanticLabel: 'Play',
                  ),
                ),
              ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
