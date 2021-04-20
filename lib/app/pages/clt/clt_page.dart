import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:pjorclt/app/shared/style/colors.dart';
import 'package:pjorclt/app/shared/widgets/card_responsible_widget.dart';
import 'package:pjorclt/app/shared/widgets/custom_text_field_widget.dart';
import 'package:pjorclt/app/shared/widgets/loading_button_widget.dart';

class CltPage extends StatefulWidget {
  @override
  _CltPageState createState() => _CltPageState();
}

class _CltPageState extends State<CltPage> {
  final monthlyFixedSalary$ = TextEditingController();
  final monthlyVariableSalary$ = TextEditingController();
  final plrAnnual$ = TextEditingController();
  final diaryRefettionValue$ = TextEditingController();
  final medicalAssistenceValue$ = TextEditingController();
  final garageValue$ = TextEditingController();
  final foodValue$ = TextEditingController();
  final phoneValue$ = TextEditingController();
  final anotherBenefitsValue$ = TextEditingController();
  final anotherDiscounts$ = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Dados CLT",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Expanded(
              child: CardResponsibleWidget(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildContent(),
                    ),
                    LoadingButtonWidget(
                      text: "Concluir",
                      color: AppColors.primary,
                      textColor: Colors.white,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            DefaultTextFieldWidget(
              controller: monthlyFixedSalary$,
              hintText: "Remuneração fixa mensal (bruta)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: monthlyVariableSalary$,
              hintText: "Remuneração variável mensal (bruta)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: plrAnnual$,
              hintText: "PLR anual (multiplos da remuneração fixa)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: diaryRefettionValue$,
              hintText: "Valor diário de vale refeição",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: medicalAssistenceValue$,
              hintText: "Valor mensal da assistência médica",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: garageValue$,
              hintText: "Valor mensal de garagem",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: foodValue$,
              hintText: "Valor do VA (mensal)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: anotherBenefitsValue$,
              hintText: "Valor mensal de outros benefícios",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: garageValue$,
              hintText: "Valor mensal de outros gastos",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
          ],
        ),
      ),
    );
  }
}
