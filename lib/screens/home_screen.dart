import 'package:flutter/material.dart';
import 'package:fitduo/screens/exercise_library_screen.dart';
import 'package:fitduo/screens/progress_tracker_screen.dart';
import 'package:fitduo/screens/quest_screen.dart';
import 'package:fitduo/screens/settings_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: TabNavigation(),
    );
  }
}

class TabNavigation extends StatelessWidget {
  const TabNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitDuo Dashboard'),
        bottom: const TabBar(
          tabs: [
            Tab(text: "Home"),
            Tab(text: "Quest"),
            Tab(text: "Workouts"),
            Tab(text: "History"),
            Tab(text: "Settings"),
          ],
        ),
      ),

      body: const TabBarView(
        children: [
          HomeTab(),
          Center(child: QuestScreen()),
          Center(child: ExerciseLibraryScreen()),
          Center(child: ProgressTrackerScreen()),
          Center(child: SettingsScreen()),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  Widget buildButton(BuildContext context, String title, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Workout Streak",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            "3 Days",
            style: TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),

          const Text(
            "Quick Actions",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          buildButton(context, 'Workout Quest', const QuestScreen()),
          buildButton(context, 'Progress Tracker', const ProgressTrackerScreen()),

        ],
      ),
    );
  }
}
