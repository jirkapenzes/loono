import 'package:loono/models/favorite_hospital.dart';
import 'package:loono/models/hospital.dart';
import 'package:loono/utils/third_party_apis.dart';

class HospitalRepository {
  HospitalRepository({
    required HospitalsApi hospitalsApi,
    required FavoriteHospitalsDao hospitalsDao,
  }) {
    _hospitalsApi = hospitalsApi;
    _hospitalsDao = hospitalsDao;
  }

  late final HospitalsApi _hospitalsApi;
  late final FavoriteHospitalsDao _hospitalsDao;

  Future<List<Hospital>> getAll() async {
    final response = await _hospitalsApi.fetchAll();

    return response.when(
      success: (hospitals) => hospitals,
      failure: (_) => [],
    );
  }

  Future<void> persistFavorite(Hospital hospital) async {
    return _hospitalsDao.save(Hospital.toFavorite(hospital));
  }

  Future<void> removeFavorite(Hospital hospital) async {
    return _hospitalsDao.remove(Hospital.toFavorite(hospital));
  }

  Future<List<Hospital>> loadFavorites() async {
    final favorites = await _hospitalsDao.getAll();
    return favorites.map(Hospital.fromFavorite).toList();
  }
}
