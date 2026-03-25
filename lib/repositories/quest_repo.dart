import 'package:fitduo/database/database_helper.dart';
import 'package:fitduo/models/quest.dart';

class QuestRepo {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<int> addQuest(Quest quest) async {
    return await _dbHelper.insertQuest(quest.toMap());
  }

  Future<List<Quest>> getQuests() async {
    final maps = await _dbHelper.getAllQuests();
    return maps.map((map) => Quest.fromMap(map)).toList();
  }
}