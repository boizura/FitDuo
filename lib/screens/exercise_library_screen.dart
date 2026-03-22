import 'package:flutter/material.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  final List<Map<String, String>> exercises = [
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

  List<Map<String, String>> get filteredExercises {
    return exercises.where((exercise) {
      return exercise['name']!
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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

            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search exercises...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: filteredExercises.isEmpty
                  ? const Center(
                      child: Text(
                        'No exercises found.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredExercises.length,
                      itemBuilder: (context, index) {
                        final exercise = filteredExercises[index];

                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: const CircleAvatar(
                              child: Icon(Icons.fitness_center),
                            ),
                            title: Text(
                              exercise['name']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'Muscle: ${exercise['muscle']}\n'
                                'Difficulty: ${exercise['difficulty']}\n'
                                'Equipment: ${exercise['equipment']}',
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${exercise['name']} selected'),
                                ),
                              );
                            },
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