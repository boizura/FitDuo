import 'package:flutter/material.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  // 🔥 Dummy data (replace with DB later)
  final List<Map<String, String>> allExercises = [
    {"name": "Bench Press", "muscle": "Chest"},
    {"name": "Squat", "muscle": "Legs"},
    {"name": "Deadlift", "muscle": "Back"},
    {"name": "Bicep Curl", "muscle": "Arms"},
    {"name": "Shoulder Press", "muscle": "Shoulders"},
  ];

  List<Map<String, String>> filteredExercises = [];

  String searchQuery = "";
  String selectedMuscle = "All";

  final List<String> muscles = [
    "All",
    "Chest",
    "Legs",
    "Back",
    "Arms",
    "Shoulders"
  ];

  @override
  void initState() {
    super.initState();
    filteredExercises = allExercises;
  }

  void filterExercises() {
    setState(() {
      filteredExercises = allExercises.where((exercise) {
        final matchesSearch = exercise["name"]!
            .toLowerCase()
            .contains(searchQuery.toLowerCase());

        final matchesMuscle = selectedMuscle == "All" ||
            exercise["muscle"] == selectedMuscle;

        return matchesSearch && matchesMuscle;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise Library"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // Search Bar
            TextField(
              decoration: const InputDecoration(
                labelText: "Search Exercises",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                searchQuery = value;
                filterExercises();
              },
            ),

            const SizedBox(height: 10),

            // Filter Dropdown
            DropdownButton<String>(
              value: selectedMuscle,
              isExpanded: true,
              items: muscles.map((muscle) {
                return DropdownMenuItem(
                  value: muscle,
                  child: Text(muscle),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMuscle = value!;
                  filterExercises();
                });
              },
            ),

            const SizedBox(height: 10),

            //  Exercise List
            Expanded(
              child: filteredExercises.isEmpty
                  ? const Center(child: Text("No exercises found"))
                  : ListView.builder(
                      itemCount: filteredExercises.length,
                      itemBuilder: (context, index) {
                        final e = filteredExercises[index];

                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.fitness_center),
                            title: Text(e["name"].toString()),
                            subtitle: Text(e["muscle"].toString()),
                            onTap: () {
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