import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pjorclt/app/shared/repositories/comparation_repository.dart';

import 'shared/notifiers/comparation_notifier.dart';

final comparationRepositoryProvider = Provider<ComparationRepository>(
  (ref) => ComparationRepository(),
);

final comparationNotifierProvider = StateNotifierProvider<ComparationNotifier>(
  (ref) => ComparationNotifier(ref.read(comparationRepositoryProvider)),
);
