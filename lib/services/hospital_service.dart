import 'package:flutter/material.dart';
import 'package:loono/models/hospital.dart';
import 'package:loono/repositories/hospital_repository.dart';

class HospitalService extends ChangeNotifier {
  HospitalService({required this.repository});

  final HospitalRepository repository;

  List<Hospital> hospitals = [];
  List<Hospital> favorites = [];
  bool isLoading = true;

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();

    hospitals = await repository.getAll();
    favorites = await repository.loadFavorites();

    isLoading = false;
    notifyListeners();
  }

  void addToFavorites(Hospital hospital) {
    favorites.add(hospital);
    repository.persistFavorite(hospital);
    notifyListeners();
  }

  void removeFromFavorites(Hospital hospital) {
    favorites.remove(hospital);
    repository.removeFavorite(hospital);
    notifyListeners();
  }
}
