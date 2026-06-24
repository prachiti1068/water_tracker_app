import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future saveGoal(int goal) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("goal", goal);
  }

  static Future<int> getGoal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("goal") ?? 3000;
  }

  static Future saveConsumed(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("consumed", amount);
  }

  static Future<int> getConsumed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("consumed") ?? 0;
  }

  static Future reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("consumed", 0);
  }
}