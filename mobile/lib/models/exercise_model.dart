class ExerciseModel {
  int? id;
  final String name;
  final int sets;
  final int reps;
  final int durationPerRepInSeconds;
  final int restBetweenSetsInSeconds;
  final String bannerImage;
  final String videoUrl;
  final String description;
  int status; // 0, 1, 2 -> 0 Not Started, 1 Doing, 2 Done

  ExerciseModel({
    this.id,
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

  ExerciseModel copy({
    int? id,
    String? name,
    int? sets,
    int? reps,
    int? durationPerRepInSeconds,
    int? restBetweenSetsInSeconds,
    String? bannerImage,
    String? videoUrl,
    String? description,
    int? status,
  }) {
    return ExerciseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      durationPerRepInSeconds:
          durationPerRepInSeconds ?? this.durationPerRepInSeconds,
      restBetweenSetsInSeconds:
          restBetweenSetsInSeconds ?? this.restBetweenSetsInSeconds,
      bannerImage: bannerImage ?? this.bannerImage,
      videoUrl: videoUrl ?? this.videoUrl,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

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

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
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
