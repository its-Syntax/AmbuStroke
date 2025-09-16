import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../core/models/survey_answer_sheet.dart';

class StorageService {
  static const String key = 'surveys';

  Future<List<SurveyAnswerSheet>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final s = prefs.getString(key);
    if (s == null || s.isEmpty) return [];
    final raw = (jsonDecode(s) as List)
        .cast<Map>()
        .map((e) => e.map((k, v) => MapEntry(k.toString(), v)))
        .cast<Map<String, dynamic>>()
        .toList();
    return raw.map((e) => SurveyAnswerSheet.fromJson(e)).toList().reversed.toList();
  }

  Future<void> save(SurveyAnswerSheet sheet) async {
    final prefs = await SharedPreferences.getInstance();
    final current = await loadRaw(prefs);
    current.add(sheet.toJson());
    await prefs.setString(key, jsonEncode(current));
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<List<Map<String, dynamic>>> loadRaw(SharedPreferences prefs) async {
    final s = prefs.getString(key);
    if (s == null || s.isEmpty) return <Map<String, dynamic>>[];
    final raw = (jsonDecode(s) as List)
        .cast<Map>()
        .map((e) => e.map((k, v) => MapEntry(k.toString(), v)))
        .cast<Map<String, dynamic>>()
        .toList();
    return raw;
  }
}

