import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loono/services/db/database.dart';

part 'hospital.freezed.dart';

part 'hospital.g.dart';

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    required int id,
    required String name,
    required String address,
    required String web,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) => _$HospitalFromJson(json);

  factory Hospital.fromFavorite(FavoriteHospital favoriteHospital) => Hospital(
        id: favoriteHospital.id,
        name: favoriteHospital.name,
        address: favoriteHospital.address,
        web: favoriteHospital.web,
      );

  static FavoriteHospital toFavorite(Hospital hospital) =>
      FavoriteHospital(id: hospital.id, name: hospital.name, address: hospital.address, web: hospital.web);
}
