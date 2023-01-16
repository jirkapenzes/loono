import 'package:drift/drift.dart';
import 'package:loono/services/db/database.dart';

part 'favorite_hospital.g.dart';

class FavoriteHospitals extends Table {
  @override
  Set<Column> get primaryKey => {id};

  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get address => text()();

  TextColumn get web => text()();
}

@DriftAccessor(tables: [FavoriteHospitals])
class FavoriteHospitalsDao extends DatabaseAccessor<AppDatabase> with _$FavoriteHospitalsDaoMixin {
  FavoriteHospitalsDao(AppDatabase db) : super(db);

  Future<List<FavoriteHospital>> getAll() async => select(favoriteHospitals).get();

  Future<void> save(FavoriteHospital hospital) async =>
      into(favoriteHospitals).insertOnConflictUpdate(hospital);

  Future<void> remove(FavoriteHospital hospital) async {
    await (delete(favoriteHospitals)
      ..where((table) => table.id.equals(hospital.id))).go();
  }
}
