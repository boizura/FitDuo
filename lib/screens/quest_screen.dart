import 'package:flutter/material.dart';
import 'package:fitduo/models/quest.dart';
import 'package:fitduo/repositories/quest_repo.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _rewardController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final QuestRepo _questRepo = QuestRepo();

  String selectedDifficulty = 'Beginner';
  bool isSaving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _goalController.dispose();
    _rewardController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveQuest() async {
    if (!_formKey.currentState!.validate()) return; 
    
    setState(() {
      isSaving = true;
    });

    final quest = Quest(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      goal: _goalController.text.trim(),
      reward: _rewardController.text.trim(),
      difficulty: selectedDifficulty,
    );

    await _questRepo.addQuest(quest);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Quest created successfully!'),
      ),
    );
    Navigator.pop(context);
    
    _titleController.clear();
    _goalController.clear();
    _rewardController.clear();
    _descriptionController.clear();

    setState(() {
      selectedDifficulty = 'Beginner';
      isSaving = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quest'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Build Your Workout Quest',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create a fitness challenge with a goal and reward.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Quest title
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Quest Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a quest title';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Description
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Goal
              TextFormField(
                controller: _goalController,
                decoration: InputDecoration(
                  labelText: 'Goal',
                  hintText: 'Example: Complete 20 push-ups daily',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a goal';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Reward
              TextFormField(
                controller: _rewardController,
                decoration: InputDecoration(
                  labelText: 'Reward',
                  hintText: 'Example: Bronze Badge',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a reward';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Difficulty
              DropdownButtonFormField<String>(
                value: selectedDifficulty,
                decoration: InputDecoration(
                  labelText: 'Difficulty',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Beginner',
                    child: Text('Beginner'),
                  ),
                  DropdownMenuItem(
                    value: 'Intermediate',
                    child: Text('Intermediate'),
                  ),
                  DropdownMenuItem(
                    value: 'Advanced',
                    child: Text('Advanced'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDifficulty = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Difficulty preview badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _difficultyColor(selectedDifficulty).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  selectedDifficulty,
                  style: TextStyle(
                    color: _difficultyColor(selectedDifficulty),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSaving ? null : _saveQuest,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    isSaving ? 'Saving...' : 'Create Quest',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}