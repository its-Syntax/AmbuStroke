import '../core/models/survey_answer_sheet.dart';
import '../services/storage_service.dart';

class HistoryViewModel {
  final StorageService _storage;
  HistoryViewModel(this._storage);

  List<SurveyAnswerSheet> items = [];

  Future<void> load() async {
    items = await _storage.load();
  }

  Future<void> clear() async {
    await _storage.clear();
    await load();
  }
}

