import 'package:flutter/material.dart';
import 'package:fitduo/screens/exercise_library_screen.dart';
import 'package:fitduo/screens/quest_screen.dart';
import 'package:fitduo/screens/progress_tracker_screen.dart';
import 'package:fitduo/screens/setting_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int streak = 5;
  int questsCompleted = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FitDuo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            const Text(
              "Welcome back!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Stats Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStat("🔥 Streak", "$streak days"),
                    _buildStat("🏆 Quests", "$questsCompleted"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Section Title
            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Grid Buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  // Exercise Library
                  _buildButton("📚 Exercises", Colors.blue, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExerciseLibraryScreen(),
                      ),
                    );                   
                  }),
                  _buildButton("🎯 Create Quest", Colors.green, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestScreen(),
                      ),
                    );
                  }),
                  _buildButton("📈 Progress", Colors.orange, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProgressTrackerScreen(),
                      ),
                    );
                  }),
                  
                  _buildButton("🤖 AI Trainer", Colors.purple, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable stat widget
  Widget _buildStat(String title, String value) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(title),
      ],
    );
  }

  // Reusable button widget
  Widget _buildButton(String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}