import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:pjorclt/app/shared/models/clt_model.dart';
import 'package:pjorclt/app/shared/models/pj_model.dart';
part 'comparation_model.g.dart';

@CopyWith()
class ComparationModel {
  final PjModel? pjModel;
  final CltModel? cltModel;

  ComparationModel({
    this.pjModel,
    this.cltModel,
  });

  String get bestOption =>
      (pjModel!.liquidValue > (cltModel!.liquidValueTotal + cltModel!.fgts))
          ? "EMPRESA"
          : "CLT";

  double get morePercent => bestOption == "EMPRESA"
      ? pjModel!.liquidValue / (cltModel!.liquidValueTotal + cltModel!.fgts)
      : (cltModel!.liquidValueTotal + cltModel!.fgts) / pjModel!.liquidValue;

  double get diferenceYearLiquid => bestOption == "EMPRESA"
      ? pjModel!.liquidValue - (cltModel!.liquidValueTotal + cltModel!.fgts)
      : (cltModel!.liquidValueTotal + cltModel!.fgts) - (pjModel!.liquidValue);
}
