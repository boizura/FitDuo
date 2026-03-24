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
            // Exercise Header
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
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Muscle Group: $muscle',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      'Equipment: $equipment',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),

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
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Description
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'This exercise helps improve strength and endurance. '
              'Focus on maintaining proper form throughout the movement. ',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),

            // Tips Section
            const Text(
              'Tips',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              '• Keep your core engaged\n'
              '• Maintain steady breathing\n',
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