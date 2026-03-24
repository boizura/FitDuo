class Exercise {
  final int? id;
  final String name;
  final String muscle;
  final String difficulty;
  final String equipment;
  final String instructions;
  final String tips;

  Exercise({
    this.id,
    required this.name,
    required this.muscle,
    required this.difficulty,
    required this.equipment,
    required this.instructions,
    required this.tips,    
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'muscle': muscle,
      'difficulty': difficulty,
      'equipment': equipment,
      'instructions': instructions,
      'tips': tips,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      muscle: map['muscle'],
      difficulty: map['difficulty'],
      equipment: map['equipment'],
      instructions: map['instructions'],
      tips: map['tips'],
    );
  }
}