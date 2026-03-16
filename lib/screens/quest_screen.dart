import 'package:flutter/material.dart';

class QuestScreen extends StatelessWidget {
  const QuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Quest'),
      ),
      body: const Center(
        child: Text(
          'Your workout quests will be displayed here.',
          style: TextStyle(fontSize: 18), 
        ),
      ),
    );
  }
}