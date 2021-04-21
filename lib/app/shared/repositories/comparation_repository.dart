import 'package:pjorclt/app/shared/models/comparation_model.dart';

class ComparationRepository {
  Future<ComparationModel> calculate({ComparationModel comparation}) async {
    await Future.delayed(Duration(seconds: 2));
    throw Exception("Error");
  }
}
