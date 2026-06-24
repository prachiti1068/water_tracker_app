import 'package:flutter/material.dart';
import 'storage_service.dart';

class SummaryScreen extends StatelessWidget {

  final int goal;
  final int consumed;

  const SummaryScreen({
    super.key,
    required this.goal,
    required this.consumed,
  });

  @override
  Widget build(BuildContext context) {

    int remaining = goal - consumed;

    double percent = (consumed / goal) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Summary"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Card(
              child: ListTile(
                title: const Text("Goal"),
                trailing: Text("$goal ml"),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text("Consumed"),
                trailing: Text("$consumed ml"),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text("Remaining"),
                trailing: Text("$remaining ml"),
              ),
            ),

            Card(
              child: ListTile(
                title: const Text("Completion"),
                trailing:
                Text("${percent.toStringAsFixed(1)}%"),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                await StorageService.reset();

                Navigator.pop(context);
              },
              child: const Text("Reset Day"),
            )
          ],
        ),
      ),
    );
  }
}