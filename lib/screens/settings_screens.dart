import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
bool isDarkMode = false;
bool notificationsEnabled = true;
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
            ),
            const Divider(height: 32),

            // Dark Mode
            const Text("Appearance", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Dark Mode"), 
              value: isDarkMode,
              onChanged: (val) {
                setState(() {
                  isDarkMode = val;
                  
                });
              },
              secondary: const Icon(Icons.brightness_6),
              ),
              const Divider(height: 32),
              // Notifications
              const Text("Notifications", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SwitchListTile(
                title: const Text("Enable Notifications"),
                value: notificationsEnabled, 
                onChanged: (val){
                  setState(() {
                    notificationsEnabled = val;
                  });
                },
                secondary: const Icon(Icons.notifications),
                ),
            const Divider(height: 32),

            // Data management
            const Text("Data",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Reset Data"),
              onTap: (){

              },
            ),

            const Divider(height: 32),

            // logout
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () {
                
              },
            )
          ]
          
        ),
      ),
    );
  } 
}