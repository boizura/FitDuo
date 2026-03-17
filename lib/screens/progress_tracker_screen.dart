import 'package:flutter/material.dart';

class ProgressTrackerScreen extends StatelessWidget {
  const ProgressTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int streak = 3;
    final int totalWorkouts = 12;
    final List<Map<String, dynamic>> weeklyWorkouts = [
      {'day': 'Mon', 'workouts': 1},
      {'day': 'Tue', 'workouts': 0},
      {'day': 'Wed', 'workouts': 1},
      {'day': 'Thu', 'workouts': 1},
      {'day': 'Fri', 'workouts': 0},
      {'day': 'Sat', 'workouts': 2},
      {'day': 'Sun', 'workouts': 0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔥 Workout Streak
            const Text(
              "Current Streak",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "$streak Days",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            //Total Workouts
            const Text(
              "Total Workouts Completed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "$totalWorkouts Workouts",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            //Weekly Trend
            const Text(
              "Weekly Workout Trend",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: weeklyWorkouts.map((day) {
                return Column(
                  children: [
                    Container(
                      height: day['workouts'] * 20.0, 
                      width: 20,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 4),
                    Text(day['day']),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            //Transformation Photos 
            const Text(
              "Transformation Photos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(width: 100, color: Colors.grey[300], margin: const EdgeInsets.all(4)),
                  Container(width: 100, color: Colors.grey[400], margin: const EdgeInsets.all(4)),
                  Container(width: 100, color: Colors.grey[500], margin: const EdgeInsets.all(4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}