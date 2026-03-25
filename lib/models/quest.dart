class Quest {
  final int? id;
  final String title;
  final String description;
  final String goal;
  final String reward;
  final String difficulty;

  Quest({
    this.id,
    required this.title,
    required this.description,
    required this.goal,
    required this.reward,
    required this.difficulty,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'goal': goal,
      'reward': reward,
      'difficulty': difficulty,
    };
  }

  factory Quest.fromMap(Map<String, dynamic> map) {
    return Quest(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      goal: map['goal'],
      reward: map['reward'],
      difficulty: map['difficulty'],
    );
  }
}