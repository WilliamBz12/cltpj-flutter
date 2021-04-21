import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pjorclt/app/shared/models/comparation_model.dart';

import 'package:pjorclt/app/shared/repositories/comparation_repository.dart';
import 'comparation_state.dart';

class ComparationNotifier extends StateNotifier<ComparationState> {
  final ComparationRepository _repository;

  ComparationNotifier(this._repository) : super(ComparationInitial());

  Future<void> getComparation(ComparationModel comparation) async {
    try {
      state = ComparationLoading();
      final result = await _repository.calculate(comparation: comparation);
      state = ComparationLoaded(result);
    } on Exception {
      state = ComparationError("Couldn't fetch");
    }
  }
}
