import 'package:flutter/material.dart';

class ProgressTrackerScreen extends StatelessWidget {
  const ProgressTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracker'),
      ),
      body: const Center(
        child: Text(
          'Your progress will be displayed here.',
          style: TextStyle(fontSize: 18), 

        ),
      ),
    );
  } 
}