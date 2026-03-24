import 'package:fitduo/database/database_helper.dart';
import 'package:fitduo/models/exercise.dart';

class ExercisesRepo {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<List<Exercise>> getExercises() async {
    final maps = await _dbHelper.getAllExercises();
    return maps.map((map) => Exercise.fromMap(map)).toList();
  }

  Future<void> seedExercises() async {
    await _dbHelper.seedExercises();
  }
}