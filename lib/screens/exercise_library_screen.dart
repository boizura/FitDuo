import 'package:flutter/material.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() =>
      _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  final TextEditingController _searchController = TextEditingController();

  String searchText = '';
  String selectedDifficulty = 'All';
  String selectedEquipment = 'All';

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

  // Filtering logic (search, difficulty and equipment)
  List<Map<String, String>> get filteredExercises {
    return exercises.where((exercise) {
      final matchesSearch = exercise['name']!
          .toLowerCase()
          .contains(searchText.toLowerCase());

      final matchesDifficulty = selectedDifficulty == 'All' ||
          exercise['difficulty'] == selectedDifficulty;

      final matchesEquipment = selectedEquipment == 'All' ||
          exercise['equipment'] == selectedEquipment;

      return matchesSearch && matchesDifficulty && matchesEquipment;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          children: [
            // Search Bar
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

            const SizedBox(height: 12),

            // Difficulty and Equipment Filter Row
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedDifficulty,
                    decoration: InputDecoration(
                      labelText: 'Difficulty',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'All', child: Text('All')),
                      DropdownMenuItem(
                          value: 'Beginner', child: Text('Beginner')),
                      DropdownMenuItem(
                          value: 'Intermediate',
                          child: Text('Intermediate')),
                      DropdownMenuItem(
                          value: 'Advanced', child: Text('Advanced')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedDifficulty = value!;
                      });
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedEquipment,
                    decoration: InputDecoration(
                      labelText: 'Equipment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'All', child: Text('All')),
                      DropdownMenuItem(
                          value: 'Bodyweight', child: Text('Bodyweight')),
                      DropdownMenuItem(
                          value: 'Dumbbells', child: Text('Dumbbells')),
                      DropdownMenuItem(
                          value: 'Barbell', child: Text('Barbell')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedEquipment = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Exercise list
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
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text('Muscle: ${exercise['muscle']}'),
                                  Text(
                                      'Equipment: ${exercise['equipment']}'),

                                  const SizedBox(height: 6),

                                  // Colored difficulty badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: _difficultyColor(
                                              exercise['difficulty']!)
                                          .withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      exercise['difficulty']!,
                                      style: TextStyle(
                                        color: _difficultyColor(
                                            exercise['difficulty']!),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${exercise['name']} selected'),
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