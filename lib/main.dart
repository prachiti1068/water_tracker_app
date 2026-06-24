import 'package:flutter/material.dart';
import 'goal_screens.dart';

void main() {
  runApp(const WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Tracker',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: GoalScreen(),
    );
  }
}