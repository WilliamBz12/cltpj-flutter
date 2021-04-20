import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:pjorclt/app/shared/style/colors.dart';
import 'package:pjorclt/app/shared/widgets/card_responsible_widget.dart';
import 'package:pjorclt/app/shared/widgets/custom_text_field_widget.dart';
import 'package:pjorclt/app/shared/widgets/loading_button_widget.dart';

class PjPage extends StatefulWidget {
  @override
  _PjPageState createState() => _PjPageState();
}

class _PjPageState extends State<PjPage> {
  final monthlyValue$ = TextEditingController();
  final vacationDaysPerYear$ = TextEditingController();
  final monthyBenefits$ = TextEditingController();
  final taxPercentage$ = TextEditingController();
  final expensesMontherAccountant$ = TextEditingController();
  final anotherYearExpenses$ = TextEditingController();

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
                  "Dados PJ",
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
              controller: monthlyValue$,
              hintText: "Remuneração fixa mensal (bruta)",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: vacationDaysPerYear$,
              hintText: "Dias de férias por ano",
              prefixIcon: Icon(Icons.hourglass_empty_sharp),
              keyboardType: TextInputType.number,
            ),
            DefaultTextFieldWidget(
              controller: monthyBenefits$,
              hintText: "Valor dps beneficios Mensais",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: taxPercentage$,
              hintText: "Percentual de imposto pago",
              prefixIcon: Icon(Icons.domain_verification_outlined),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "% ")],
            ),
            DefaultTextFieldWidget(
              controller: expensesMontherAccountant$,
              hintText: "Gastos Mensais com o contador",
              prefixIcon: Icon(Icons.money),
              keyboardType: TextInputType.number,
              inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
            ),
            DefaultTextFieldWidget(
              controller: anotherYearExpenses$,
              hintText: "Outras despesas anuais",
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
