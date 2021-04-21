import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pjorclt/app/shared/notifiers/comparation/comparation_notifier.dart';
import 'package:pjorclt/app/shared/notifiers/data/data_comparation_notifier.dart';
import 'package:pjorclt/app/shared/repositories/comparation_repository.dart';

import 'shared/models/comparation_model.dart';
import 'shared/notifiers/comparation/comparation_notifier.dart';
import 'shared/notifiers/comparation/comparation_state.dart';

final comparationRepositoryProvider = Provider<ComparationRepository>(
  (_) => ComparationRepository(),
);

final comparationNotifierProvider =
    StateNotifierProvider<ComparationNotifier, ComparationState>(
  (ref) => ComparationNotifier(ref.read(comparationRepositoryProvider)),
);

final dataComparationProvider =
    StateNotifierProvider<DataComparationNotifier, ComparationModel>(
  (_) => DataComparationNotifier(),
);
