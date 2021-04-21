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
}

// Rendimento anual bruto
// Valor da nota mensal fixo (bruto)
// Férias
// Férias remuneradas?
// Dias de férias por ano
// Benefícios anuais
// Valor mensal de garagem
// Valor mensal de celular
// Valor mensal de outros benefícios

// Descontos anuais
// Pro-Labore / Salário-Base para INSS
// INSS PF (Classe 1 - Salário-Base R$3135,)
// Outros
// INSS PJ (Pro-Labore R$3135,)
// ISSQN (%)
// PIS
// Confins
// IR
// Contribuição Social (CSLL)
// Despesas com contador (mensal)
// Contribuição sindical anual
// Despesas anuais com a empresa
