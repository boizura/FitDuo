import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final String name;
  final String muscle;
  final String difficulty;
  final String equipment;
  final String instructions;
  final String tips;

  const ExerciseDetailScreen({
    super.key,
    required this.name,
    required this.muscle,
    required this.difficulty,
    required this.equipment,
    required this.instructions,
    required this.tips,
  });

  // Colors for difficulty levels
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
            // Exercise Header (icon and name)
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Icon(_muscleIcon(muscle), size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
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
                    Text(
                      'Muscle Group: $muscle',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Equipment: $equipment',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 12),

                    // Difficulty badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _difficultyColor(difficulty).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        difficulty,
                        style: TextStyle(
                          color: _difficultyColor(difficulty),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Instruction
            const Text(
              'Instruction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              instructions,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Tips Section
            const Text(
              'Tips',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              tips,
              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            // Start Workout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$name workout started!'),
                    ),
                  );
                },
                child: const Text(
                  'Start Workout',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}