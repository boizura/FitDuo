import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


String userName = "Maliyah Fleming";
String fitnessGoal = "Build muscle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // profile
            const Text("Profile", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(userName),
              subtitle: Text("Fitness goal: $fitnessGoal"),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {

                },
                ),
            )
          ]
          
        ),
      ),
    );
  } 
}