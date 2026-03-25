import 'package:flutter/material.dart';
import 'package:fitduo/models/quest.dart';
import 'package:fitduo/repositories/quest_repo.dart';

class ProgressTrackerScreen extends StatelessWidget {
  const ProgressTrackerScreen({super.key});

  @override
  State<ProgressTrackerScreen> createState() => _ProgressTrackerScreenState();
  }

class _ProgressTrackerScreenState extends State<ProgressTrackerScreen> {
  final QuestRepo _questRepo = QuestRepo();

  List<Quest> quests = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuests();
  }

  Future<void> _loadQuests() async {
    final data = await _questRepo.getQuests();
    setState(() {
      quests = data;
      isLoading = false;
    });
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

  double _fakeProgress(String difficulty) {
    switch (difficulty) {
      case 'Beginner':
        return 0.3;
      case 'Intermediate':
        return 0.6;
      case 'Advanced':
        return 0.85;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page title
            const Text(
              'Your Progress',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Track your quest progress and achievements here.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Example progress card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '7-Day Push-Up Challenge',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Goal: Complete 20 push-ups daily',
                      style: TextStyle(fontSize: 15),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Progress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    LinearProgressIndicator(
                      value: 0.4,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      '40% completed',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}