class PjModel {
  double monthlyValue;

  double vacationYearDays;

  bool vacationPaid;

  double monthyBenefits;

  double taxPercentage;

  double expensesMotnherAccountant;
  double anotherYearExpenses;
  double anotherMonthExpenses;

  PjModel({
    required this.anotherYearExpenses,
    required this.expensesMotnherAccountant,
    required this.anotherMonthExpenses,
    required this.monthlyValue,
    required this.monthyBenefits,
    required this.taxPercentage,
    required this.vacationPaid,
    required this.vacationYearDays,
  });

  double get yearAmount => (12 - vacationYearDays / 30) * monthlyValue;

  double get vacationAmount =>
      vacationPaid ? monthlyValue * (vacationYearDays / 30) : 0;

  double get yearBenefits => monthyBenefits * 12;

  double get yearDiscount =>
      (expensesMotnherAccountant +
              anotherMonthExpenses +
              (taxPercentage * monthlyValue)) *
          12 +
      anotherYearExpenses;

  double get allRendimentsPerYear => yearAmount + vacationAmount + yearBenefits;

  double get liquidValue => allRendimentsPerYear - yearDiscount;
}
