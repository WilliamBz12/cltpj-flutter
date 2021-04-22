class CltModel {
  double monthlyFixedSalary;
  double monthlyVariableSalary;

  double plrAnnual;

  double diaryRefettionValue;
  double medicalAssistenceValue;
  double garageValue;
  double foodValue;
  double phoneValue;
  double anotherBenefitsValue;
  double anotherDiscounts;

  CltModel({
    required this.anotherBenefitsValue,
    required this.diaryRefettionValue,
    required this.foodValue,
    required this.garageValue,
    required this.medicalAssistenceValue,
    required this.monthlyFixedSalary,
    required this.monthlyVariableSalary,
    required this.phoneValue,
    required this.plrAnnual,
    required this.anotherDiscounts,
  });

  double get annualGrossSalary =>
      (monthlyFixedSalary + monthlyVariableSalary) * 11;

  double get vacations => 1.33 * (monthlyFixedSalary + monthlyVariableSalary);

  double get thirdTeenSalary => (monthlyFixedSalary + monthlyVariableSalary);

  double get plrValue => plrAnnual * monthlyFixedSalary;

  double get allBenefits =>
      ((diaryRefettionValue * 21) +
          phoneValue +
          medicalAssistenceValue +
          garageValue +
          foodValue +
          anotherBenefitsValue) *
      12;

  double get allDiscounts {
    final inss = 13 * 171.77;

    final refetion = diaryRefettionValue * 21 * 12 * 0.2;

    return inss + irpf + refetion + anotherDiscounts;
  }

  double get irpf {
    if ((annualGrossSalary + vacations + plrAnnual) * 0.2 <= 9400) {
      return (annualGrossSalary + vacations + plrAnnual) * 0.8 * 0.275 - 5076.9;
    } else {
      return (annualGrossSalary + vacations + plrAnnual - 9400) * 0.275 -
          5076.9;
    }
  }

  double get allRendiments =>
      allBenefits + annualGrossSalary + thirdTeenSalary + plrValue;

  double get liquidValueTotal => allRendiments - allDiscounts;

  double get fgts =>
      (annualGrossSalary + vacations + plrAnnual + thirdTeenSalary) * .08;

  double get rendimentsWithFgts => allRendiments + fgts;

  double get totalLiquidWithFgts => rendimentsWithFgts - allDiscounts;
}
