import 'package:flutter/material.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  // Dummy quest data for UI
  List<Map<String, dynamic>> quests = [
    {
      'title': '10 Pushups Daily',
      'goal': 10,
      'progress': 3, // days completed
      'reward': 'Badge: Pushup Pro'
    },
    {
      'title': 'Lose 5 lbs in 2 weeks',
      'goal': 5,
      'progress': 2, // lbs lost
      'reward': 'Badge: Weight Warrior'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Quests"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Button to add new quest
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Open add quest form
              },
              icon: const Icon(Icons.add),
              label: const Text("Create New Quest"),
            ),
            const SizedBox(height: 16),

            // Quest list
            Expanded(
              child: quests.isEmpty
                  ? const Center(child: Text("No quests yet. Create your first fitness quest!"))
                  : ListView.builder(
                      itemCount: quests.length,
                      itemBuilder: (context, index) {
                        final quest = quests[index];
                        final progressPercent = quest['progress'] / quest['goal'];
                        return Card(
                          child: ListTile(
                            title: Text(quest['title']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LinearProgressIndicator(
                                  value: progressPercent,
                                  color: Colors.blue,
                                  backgroundColor: Colors.grey[300],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Progress: ${quest['progress']} / ${quest['goal']}',
                                ),
                                Text('Reward: ${quest['reward']}'),
                              ],
                            ),
                            trailing: PopupMenuButton<String>(
                              onSelected: (value) {
                                // TODO: Handle edit/delete
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                                const PopupMenuItem(value: 'delete', child: Text('Delete')),
                              ],
                            ),
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
