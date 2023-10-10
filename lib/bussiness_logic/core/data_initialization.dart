import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Class for data initialization,
/// This contains a method that fetch data from JSON file [assets/json/PeriodicTableJSON.json].
/// This JSON file contains all information of present elements in periodic table.
class PeriodicTableData {
  /// Data variable that stores all data fetched from JSON file.
  static late Map<String, dynamic> data;

  /// Method returns data fetched from JSON file containing information of all elements in periodic table.
  static Future<Map<String, dynamic>> getData() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/PeriodicTableJSON.json');
    final data = jsonDecode(jsonString);
    return data;
  }
}
