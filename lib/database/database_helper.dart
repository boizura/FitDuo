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
      version: 2,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE exercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        muscle TEXT NOT NULL,
        difficulty TEXT NOT NULL,
        equipment TEXT NOT NULL,
        instructions TEXT,
        tips TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
        "ALTER TABLE exercises ADD COLUMN instructions TEXT NOT NULL DEFAULT ''",
      );
      await db.execute(
        "ALTER TABLE exercises ADD COLUMN tips TEXT NOT NULL DEFAULT ''",
      );
    }
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
        'instructions':
        'Start in a plank position with your hands slightly wider than shoulder-width apart. Lower your body until your chest is close to the floor, then push back up to the starting position.',
        'tips':
        'Keep your body in a straight line. Do not let your hips sag. Breathe out as you push upward.',
      },
      {
        'name': 'Squat',
        'muscle': 'Legs',
        'difficulty': 'Beginner',
        'equipment': 'Bodyweight',
        'instructions':
        'Stand with your feet shoulder-width apart. Bend your knees and push your hips back as if sitting in a chair. Lower until your thighs are parallel to the ground, then stand back up.',
        'tips':
        'Keep your chest up and knees aligned with your toes. Press through your heels when standing.',
      },
      {
        'name': 'Plank',
        'muscle': 'Core',
        'difficulty': 'Beginner',
        'equipment': 'Bodyweight',
        'instructions':
        'Place your forearms on the floor and extend your legs behind you. Keep your body in a straight line from head to heels and hold the position.',
        'tips':
        'Tighten your core and glutes. Do not let your lower back sink. Keep your neck neutral.',
      },
      {
        'name': 'Dumbbell Curl',
        'muscle': 'Arms',
        'difficulty': 'Intermediate',
        'equipment': 'Dumbbells',
        'instructions':
        'Hold a dumbbell in each hand with your arms at your sides. Curl the weights upward toward your shoulders, then lower them slowly.',
        'tips':
        'Keep your elbows close to your body. Avoid swinging the weights. Control the lowering phase.',
      },
      {
        'name': 'Deadlift',
        'muscle': 'Back',
        'difficulty': 'Advanced',
        'equipment': 'Barbell',
        'instructions':
        'Stand with your feet hip-width apart under the barbell. Bend at your hips and knees to grip the bar. Lift by extending your hips and knees until standing tall, then lower the bar with control.',
        'tips':
        'Keep your back flat and chest up. Drive through your heels. Do not round your lower back.',
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