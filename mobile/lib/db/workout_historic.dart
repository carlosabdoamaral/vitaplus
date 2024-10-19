import 'package:vitaplus/db/config.dart';
import 'package:vitaplus/main.dart';

const String workoutHistoricTable = 'workout_historic_tb';

class WorkoutHistoricFields {
  static final List<String> values = [
    id,
    workoutId,
    exercisesDone,
    feedbackNote,
    durationInMinutes,
    createdAt,
  ];

  static const String id = '_id';
  static const String workoutId = 'workout_id';
  static const String exercisesDone = 'exercises_done';
  static const String feedbackNote = 'feedback_note';
  static const String durationInMinutes = 'duration_in_minutes';
  static const String createdAt = 'created_at';
}

class WorkoutHistoric {
  final int? id;
  final int workoutId;
  final String exercisesDone;
  final int feedbackNote;
  final int durationInMinutes;
  final DateTime createdAt;

  WorkoutHistoric({
    this.id,
    required this.workoutId,
    required this.exercisesDone,
    required this.feedbackNote,
    required this.durationInMinutes,
    required this.createdAt,
  });

  WorkoutHistoric copy({
    int? id,
    int? workoutId,
    String? exercisesDone,
    int? feedbackNote,
    int? durationInMinutes,
    DateTime? createdAt,
  }) =>
      WorkoutHistoric(
        id: id ?? this.id,
        workoutId: workoutId ?? this.workoutId,
        exercisesDone: exercisesDone ?? this.exercisesDone,
        feedbackNote: feedbackNote ?? this.feedbackNote,
        durationInMinutes: durationInMinutes ?? this.durationInMinutes,
        createdAt: createdAt ?? this.createdAt,
      );

  static WorkoutHistoric fromJson(Map<String, Object?> json) => WorkoutHistoric(
        id: json[WorkoutHistoricFields.id] as int?,
        workoutId: json[WorkoutHistoricFields.workoutId] as int,
        exercisesDone: json[WorkoutHistoricFields.exercisesDone] as String,
        feedbackNote: json[WorkoutHistoricFields.feedbackNote] as int,
        durationInMinutes: json[WorkoutHistoricFields.durationInMinutes] as int,
        createdAt:
            DateTime.parse(json[WorkoutHistoricFields.createdAt] as String),
      );

  Map<String, Object?> toJson() => {
        WorkoutHistoricFields.id: id,
        WorkoutHistoricFields.workoutId: workoutId,
        WorkoutHistoricFields.exercisesDone: exercisesDone,
        WorkoutHistoricFields.feedbackNote: feedbackNote,
        WorkoutHistoricFields.durationInMinutes: durationInMinutes,
        WorkoutHistoricFields.createdAt: createdAt.toIso8601String(),
      };
}

Future<WorkoutHistoric> createWorkoutHistoric(
  WorkoutHistoric workoutHistoric,
) async {
  final db = await MainDatabase.instance.database;
  final id = await db.insert(workoutHistoricTable, workoutHistoric.toJson());
  final newWorkout = workoutHistoric.copy(id: id);

  var prevList = workoutHistoricNotifier.historic;
  workoutHistoricNotifier.setHistoric([...prevList, newWorkout]);

  return newWorkout;
}

Future<WorkoutHistoric?> readWorkoutHistoric(int id) async {
  final db = await MainDatabase.instance.database;

  final maps = await db.query(
    workoutHistoricTable,
    columns: WorkoutHistoricFields.values,
    where: '${WorkoutHistoricFields.id} = ?',
    whereArgs: [id],
  );

  if (maps.isNotEmpty) {
    return WorkoutHistoric.fromJson(maps.first);
  } else {
    return null;
  }
}

Future<List<WorkoutHistoric>> readAllWorkoutHistorics() async {
  final db = await MainDatabase.instance.database;

  const orderBy = '${WorkoutHistoricFields.createdAt} ASC';
  final result = await db.query(workoutHistoricTable, orderBy: orderBy);
  final res = result.map((json) => WorkoutHistoric.fromJson(json)).toList();

  workoutHistoricNotifier.setHistoric(res);

  return res;
}

Future<int> updateWorkoutHistoric(WorkoutHistoric workoutHistoric) async {
  final db = await MainDatabase.instance.database;

  return db.update(
    workoutHistoricTable,
    workoutHistoric.toJson(),
    where: '${WorkoutHistoricFields.id} = ?',
    whereArgs: [workoutHistoric.id],
  );
}

Future<int> deleteWorkoutHistoric(int id) async {
  final db = await MainDatabase.instance.database;

  return await db.delete(
    workoutHistoricTable,
    where: '${WorkoutHistoricFields.id} = ?',
    whereArgs: [id],
  );
}

Future close() async {
  final db = await MainDatabase.instance.database;

  db.close();
}
