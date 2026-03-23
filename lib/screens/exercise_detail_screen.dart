import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final String name;
  final String muscle;
  final String difficulty;
  final String equipment;

  const ExerciseDetailScreen({
    super.key,
    required this.name,
    required this.muscle,
    required this.difficulty,
    required this.equipment,
  });

  // Difficulty color
  Color _difficultyColor(String difficulty) {
    switch (difficulty) {
      case 'Beginner':
        return Colors.green;
      case 'Intermediate':
        return Colors.orange;
      case 'Advanced':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // Muscle icon
  IconData _muscleIcon(String muscle) {
    switch (muscle) {
      case 'Chest':
        return Icons.fitness_center;
      case 'Legs':
        return Icons.directions_run;
      case 'Core':
        return Icons.self_improvement;
      case 'Arms':
        return Icons.sports_gymnastics;
      case 'Back':
        return Icons.accessibility_new;
      default:
        return Icons.fitness_center;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header (icon + name)
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Icon(_muscleIcon(muscle), size: 30),
                ),
                const SizedBox(width: 16),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Info Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Muscle: $muscle',
                        style: const TextStyle(fontSize: 18)),

                    const SizedBox(height: 8),

                    Text('Equipment: $equipment',
                        style: const TextStyle(fontSize: 18)),

                    const SizedBox(height: 12),

                    // Difficulty badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color:
                            _difficultyColor(difficulty).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        difficulty,
                        style: TextStyle(
                          color: _difficultyColor(difficulty),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}