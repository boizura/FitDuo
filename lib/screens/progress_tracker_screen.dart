import 'package:flutter/material.dart';
import 'package:fitduo/models/quest.dart';
import 'package:fitduo/repositories/quest_repo.dart';

class ProgressTrackerScreen extends StatefulWidget {
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
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : quests.isEmpty
                ? const Center(
                    child: Text(
                      'No saved quests yet.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: quests.length,
                    itemBuilder: (context, index) {
                      final quest = quests[index];
                      final progress = _fakeProgress(quest.difficulty);

                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                quest.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                quest.description,
                                style: const TextStyle(fontSize: 15),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                'Goal: ${quest.goal}',
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                'Reward: ${quest.reward}',
                                style: const TextStyle(fontSize: 15),
                              ),

                              const SizedBox(height: 10),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: _difficultyColor(quest.difficulty)
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  quest.difficulty,
                                  style: TextStyle(
                                    color: _difficultyColor(quest.difficulty),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 14),

                              const Text(
                                'Progress',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),

                              LinearProgressIndicator(
                                value: progress,
                                minHeight: 10,
                                borderRadius: BorderRadius.circular(10),
                              ),

                              const SizedBox(height: 8),

                              Text('${(progress * 100).toInt()}% completed'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}