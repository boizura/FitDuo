import 'package:flutter/material.dart';

class ExerciseLibraryScreen extends StatelessWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Exercises',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const CircleAvatar(
                  child: Icon(Icons.fitness_center),
                ),
                title: const Text(
                  'Push-Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'Muscle Group: Chest\n'
                    'Difficulty: Beginner\n'
                    'Equipment: Bodyweight',
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Push-Up selected'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}