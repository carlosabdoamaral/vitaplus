import 'package:vitaplus/models/exercise_model.dart';

class WorkoutModel {
  final int? id;
  final String name;
  final int durationInMinutes;
  final String category;
  final String bannerImage; // Imagem de banner do treino
  final List<ExerciseModel> exercises;

  const WorkoutModel({
    this.id,
    required this.name,
    required this.durationInMinutes,
    required this.category,
    required this.bannerImage,
    required this.exercises,
  });

  WorkoutModel copy({
    int? id,
    String? name,
    int? durationInMinutes,
    String? category,
    String? bannerImage,
    List<ExerciseModel>? exercises,
  }) =>
      WorkoutModel(
        id: id ?? this.id,
        name: name ?? this.name,
        durationInMinutes: durationInMinutes ?? this.durationInMinutes,
        category: category ?? this.category,
        bannerImage: bannerImage ?? this.bannerImage,
        exercises: exercises ?? this.exercises,
      );

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
      exercises: List<ExerciseModel>.from(
        map['exercises']?.map((e) => ExerciseModel.fromMap(e)) ?? [],
      ),
    );
  }
}
