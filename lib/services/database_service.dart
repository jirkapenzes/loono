import 'package:flutter/material.dart';
import 'package:loono/models/calendar_event.dart';
import 'package:loono/models/examination_questionnaire.dart';
import 'package:loono/models/favorite_hospital.dart';
import 'package:loono/models/user.dart';
import 'package:loono/services/db/database.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  late AppDatabase _engine;
  late final UsersDao users;
  late final CalendarEventsDao calendarEvents;
  late final ExaminationQuestionnairesDao examinationQuestionnaires;
  late final FavoriteHospitalsDao favoriteHospitalsDao;

  Future<void> init(String key) async {
    try {
      await (await getApplicationSupportDirectory()).create(recursive: true);
    } catch (_) {
      debugPrint('directory could not be created');
    }
    _engine = AppDatabase('app.db', key);
    users = _engine.usersDao;
    calendarEvents = _engine.calendarEventsDao;
    examinationQuestionnaires = _engine.examinationQuestionnairesDao;
    favoriteHospitalsDao = _engine.favoriteHospitalsDao;
  }

  Future<void> clearDb() {
    return _engine.deleteAllData();
  }

  /// Should be used only in testing!!
  @visibleForTesting
  Future<void> closeDb() async {
    await _engine.close();
  }
}
