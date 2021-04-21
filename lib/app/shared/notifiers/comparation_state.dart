import 'package:pjorclt/app/shared/models/comparation_model.dart';

abstract class ComparationState {
  const ComparationState();
}

class ComparationInitial extends ComparationState {
  const ComparationInitial();
}

class ComparationLoading extends ComparationState {
  const ComparationLoading();
}

class ComparationLoaded extends ComparationState {
  final ComparationModel comparation;
  const ComparationLoaded(this.comparation);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ComparationLoaded && o.comparation == comparation;
  }

  @override
  int get hashCode => comparation.hashCode;
}

class ComparationError extends ComparationState {
  final String message;
  const ComparationError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ComparationError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
