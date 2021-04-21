import 'package:pjorclt/app/shared/models/clt_model.dart';
import 'package:pjorclt/app/shared/models/pj_model.dart';
import 'package:pjorclt/app/shared/models/comparation_model.dart';

class ComparationRepository {
  Future<ComparationModel> calculate({CltModel clt, PjModel pj}) async {
    await Future.delayed(Duration(seconds: 2));
    throw Exception("Error");
  }
}
