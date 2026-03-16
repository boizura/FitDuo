import 'package:flutter/material.dart';
// import 'screens/progress_tracker_screen.dart';
// import 'screens/exercise_library_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FitDuo Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets .all(16.0),
        child: Column(
          children: [
            const Text("Workout Streak: 3 Days", style: TextStyle(fontSize: 18)), 
            const SizedBox(height: 20),
            // buildButton(context, 'Exercise Library', const exercise_library_screen()),
            // buildButton(context, 'Workout quest', const quest_screen()),
            // buildButton(context, 'Progress Tracker', const progress_tracker_screen()),

          ],
        ),
    ),
    );
  }
}