import 'package:flutter/material.dart';
import 'package:fitduo/screens/progress_tracker_screen.dart';
// import 'screens/exercise_library_screen.dart';
import 'package:fitduo/screens/quest_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: _TabsNonScrollableDemo(),
      )
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  _TabsNonScrollableDemoState createState() => _TabsNonScrollableDemoState();
}

class _TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo> 
  with SingleTickerProviderStateMixin, RestorationMixin {

  late TabController _controller;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _controller.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 4);
    _controller.addListener(() {
      setState(() {
        tabIndex.value = _controller.index;
      });
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    tabIndex.dispose();
    super.dispose();
  }

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
    final tabs = ['Home', 'Workouts','History','Settings'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FitDuo Dashboard'),
        bottom: TabBar(
          controller: _controller,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text:tab),
          ]
        )
      ),
      body: Padding(
        padding: const EdgeInsets .all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Workout Streak: 3 Days", style: TextStyle(fontSize: 18)), 
            const SizedBox(height: 20),
            // buildButton(context, 'Exercise Library', const exercise_library_screen()),
            buildButton(context, 'Workout quest', const QuestScreen()),
            buildButton(context, 'Progress Tracker', const ProgressTrackerScreen()),

          ],
        ),
    ),
    );
  }
}
