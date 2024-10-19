// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:flutter/foundation.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
import 'package:vitaplus/db/workout_historic.dart';

class MainDatabase {
  static final MainDatabase instance = MainDatabase._init();
  static Database? _database;
  MainDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('vitaplus_beta.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    if (kDebugMode) {
      print(path);
    }

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
    );
  }

  Future<dynamic> _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    // await db.execute('''
    // CREATE TABLE $workoutTable (
    //   ${WorkoutFields.id} $idType,
    //   ${WorkoutFields.name} $textType,
    //   ${WorkoutFields.durationInMinutes} $textType,
    //   ${WorkoutFields.category} $textType,
    //   ${WorkoutFields.bannerImage} $textType,
    // )''');

    // await db.execute('''
    // CREATE TABLE $exerciseTable (
    //   ${ExerciseFields.id} $idType,
    //   ${ExerciseFields.workoutId} $intType,
    //   ${ExerciseFields.name} $textType,
    //   ${ExerciseFields.sets} $intType,
    //   ${ExerciseFields.reps} $intType,
    //   ${ExerciseFields.durationPerRepInSeconds} $intType,
    //   ${ExerciseFields.restBetweenSetsInSeconds} $intType,
    //   ${ExerciseFields.bannerImage} $textType,
    //   ${ExerciseFields.videoUrl} $textType,
    //   ${ExerciseFields.description} $textType,
    //   ${ExerciseFields.status} $intType,
    //   FOREIGN KEY (${ExerciseFields.workoutId}) REFERENCES $workoutTable(${WorkoutFields.id})
    // );
    // ''');

    await db.execute('''
    CREATE TABLE $workoutHistoricTable (
      ${WorkoutHistoricFields.id} $idType,
      ${WorkoutHistoricFields.workoutId} $intType,
      ${WorkoutHistoricFields.exercisesDone} $textType,
      ${WorkoutHistoricFields.feedbackNote} $intType,
      ${WorkoutHistoricFields.durationInMinutes} $intType,
      ${WorkoutHistoricFields.createdAt} $textType
    ); 
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<String> resetDatabase() async {
    final db = await instance.database;

    // TODO

    return "OK";
  }

  Future<dynamic> alterTable(String TableName, String ColumneName) async {
    var db = await MainDatabase.instance.database;
    var count = await db.execute("ALTER TABLE $TableName ADD "
        "COLUMN $ColumneName TEXT;");

    return count;
  }
}
