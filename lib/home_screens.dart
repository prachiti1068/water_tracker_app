import 'package:flutter/material.dart';
import 'summary_screens.dart';
import 'storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int goal = 3000;
  int consumed = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    goal = await StorageService.getGoal();
    consumed = await StorageService.getConsumed();

    setState(() {});
  }

  Future<void> addWater(int amount) async {
    consumed += amount;

    await StorageService.saveConsumed(consumed);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double progress = consumed / goal;

    if (progress > 1) {
      progress = 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            SizedBox(
              width: 180,
              height: 180,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 15,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "$consumed / $goal ml",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => addWater(250),
                  child: const Text("+250"),
                ),
                ElevatedButton(
                  onPressed: () => addWater(500),
                  child: const Text("+500"),
                ),
                ElevatedButton(
                  onPressed: () => addWater(1000),
                  child: const Text("+1000"),
                ),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              icon: const Icon(Icons.analytics),
              label: const Text("Daily Summary"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryScreen(
                      goal: goal,
                      consumed: consumed,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}