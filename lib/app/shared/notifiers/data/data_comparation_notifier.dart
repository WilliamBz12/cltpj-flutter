import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pjorclt/app/shared/models/clt_model.dart';
import 'package:pjorclt/app/shared/models/comparation_model.dart';
import 'package:pjorclt/app/shared/models/pj_model.dart';

class DataComparationNotifier extends StateNotifier<ComparationModel> {
  DataComparationNotifier() : super(ComparationModel());

  void addPjModel(PjModel? pjModel) {
    state = state.copyWith(pjModel: pjModel);
  }

  void addCltModel(CltModel? cltModel) {
    state = state.copyWith(cltModel: cltModel);
  }

  void clearClt() {
    state = state.copyWith(cltModel: null);
  }
}
