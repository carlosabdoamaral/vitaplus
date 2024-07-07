class WorkoutModel {
  final String id;
  final String name;
  final int durationInMinutes;
  final String category;
  final String bannerImage; // Imagem de banner do treino
  List<Exercise> exercises;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.durationInMinutes,
    required this.category,
    required this.bannerImage,
    required this.exercises,
  });

  int getTotalDurationInMinutes() {
    return exercises.fold(
      0,
      (total, exercise) =>
          total +
          (exercise.reps * exercise.durationPerRepInSeconds ~/ 60) +
          (exercise.sets * exercise.restBetweenSetsInSeconds ~/ 60),
    );
  }

  void addExercise(Exercise exercise) {
    exercises.add(exercise);
  }

  void removeExercise(Exercise exercise) {
    exercises.remove(exercise);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'durationInMinutes': durationInMinutes,
      'category': category,
      'bannerImage': bannerImage,
      'exercises': exercises.map((e) => e.toMap()).toList(),
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      id: map['id'],
      name: map['name'],
      durationInMinutes: map['durationInMinutes'],
      category: map['category'],
      bannerImage: map['bannerImage'],
      exercises: List<Exercise>.from(
        map['exercises']?.map((e) => Exercise.fromMap(e)) ?? [],
      ),
    );
  }
}

class Exercise {
  final String id;
  final String name;
  final int sets;
  final int reps;
  final int durationPerRepInSeconds;
  final int restBetweenSetsInSeconds;
  final String bannerImage;
  final String videoUrl;
  final String description;
  int status; // 0, 1, 2 -> 0 Not Started, 1 Doing, 2 Done

  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.durationPerRepInSeconds,
    required this.restBetweenSetsInSeconds,
    required this.bannerImage,
    required this.videoUrl,
    required this.description,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sets': sets,
      'reps': reps,
      'durationPerRepInSeconds': durationPerRepInSeconds,
      'restBetweenSetsInSeconds': restBetweenSetsInSeconds,
      'bannerImage': bannerImage,
      'videoUrl': videoUrl,
      'description': description,
      'status': status,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      sets: map['sets'],
      reps: map['reps'],
      durationPerRepInSeconds: map['durationPerRepInSeconds'],
      restBetweenSetsInSeconds: map['restBetweenSetsInSeconds'],
      bannerImage: map['bannerImage'],
      videoUrl: map['videoUrl'],
      description: map['description'],
      status: map['status'],
    );
  }
}
