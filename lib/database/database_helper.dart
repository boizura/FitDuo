import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('fitduo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE exercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        muscle TEXT NOT NULL,
        difficulty TEXT NOT NULL,
        equipment TEXT NOT NULL
      )
    ''');
  }

  Future<void> seedExercises() async {
    final db = await database;

    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM exercises'),
    );

    if (count != null && count > 0) return;

    final exercises = [
      {
        'name': 'Push-Up',
        'muscle': 'Chest',
        'difficulty': 'Beginner',
        'equipment': 'Bodyweight',
      },
      {
        'name': 'Squat',
        'muscle': 'Legs',
        'difficulty': 'Beginner',
        'equipment': 'Bodyweight',
      },
      {
        'name': 'Plank',
        'muscle': 'Core',
        'difficulty': 'Beginner',
        'equipment': 'Bodyweight',
      },
      {
        'name': 'Dumbbell Curl',
        'muscle': 'Arms',
        'difficulty': 'Intermediate',
        'equipment': 'Dumbbells',
      },
      {
        'name': 'Deadlift',
        'muscle': 'Back',
        'difficulty': 'Advanced',
        'equipment': 'Barbell',
      },
    ];

    for (final exercise in exercises) {
      await db.insert('exercises', exercise);
    }
  }

  Future<List<Map<String, dynamic>>> getAllExercises() async {
    final db = await database;
    return await db.query('exercises', orderBy: 'name ASC');
  }
}