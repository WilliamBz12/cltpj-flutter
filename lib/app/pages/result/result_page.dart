import 'package:flutter/material.dart';
import 'package:pjorclt/app/shared/models/comparation_model.dart';
import 'package:pjorclt/app/shared/style/colors.dart';
import 'package:pjorclt/app/shared/widgets/app_bar.dart';
import 'package:pjorclt/app/shared/widgets/card_responsible_widget.dart';

extension on double {
  String get toMoney => "R\$ ${this.toStringAsFixed(2).replaceAll(".", ",")}";
}

class ResultPage extends StatefulWidget {
  final ComparationModel data;
  ResultPage({required this.data});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Widget _buildItem({
    required String text,
    required String content,
    Color? color = Colors.black,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Text(
          content,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedAppBar("Resultado"),
              CardResponsibleWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "É melhor ser ${widget.data.bestOption}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildItem(
                      text: "Diferença % a mais como ${widget.data.bestOption}",
                      content:
                          "${(widget.data.morePercent * 100).toStringAsFixed(2).replaceAll(".", ",")}%",
                    ),
                    SizedBox(height: 20),
                    _buildItem(
                      text:
                          "Diferença líquida anual como ${widget.data.bestOption}",
                      content: "${widget.data.diferenceYearLiquid.toMoney}",
                      color: AppColors.success,
                    ),
                  ],
                ),
              ),
              CardResponsibleWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CLT",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    _buildItem(
                      text: "Total dos rendimentos",
                      content: "${widget.data.cltModel!.allRendiments.toMoney}",
                      color: AppColors.success,
                    ),
                    SizedBox(height: 10),
                    _buildItem(
                      text: "Total de descontos",
                      content:
                          "- ${widget.data.cltModel!.allDiscounts.toMoney}",
                      color: AppColors.danger,
                    ),
                    SizedBox(height: 10),
                    _buildItem(
                      text: "Total líquido",
                      content:
                          "${widget.data.cltModel!.liquidValueTotal.toMoney}",
                      color: AppColors.success,
                    ),
                    SizedBox(height: 10),
                    _buildItem(
                      text: "FGTS Anual",
                      content: "${widget.data.cltModel!.fgts.toMoney}",
                    ),
                    SizedBox(height: 10),
                    _buildItem(
                      text: "Total líquido com FGTS",
                      content:
                          "${widget.data.cltModel!.totalLiquidWithFgts.toMoney}",
                      color: AppColors.success,
                    ),
                  ],
                ),
              ),
              CardResponsibleWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PJ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    _buildItem(
                      text: "Total dos rendimentos",
                      content:
                          "${widget.data.pjModel!.allRendimentsPerYear.toMoney}",
                      color: AppColors.success,
                    ),
                    SizedBox(height: 10),
                    _buildItem(
                      text: "Total de descontos",
                      content: "- ${widget.data.pjModel!.yearDiscount.toMoney}",
                      color: AppColors.danger,
                    ),
                    SizedBox(height: 10),
                    _buildItem(
                      text: "Total líquido",
                      content: "${widget.data.pjModel!.liquidValue.toMoney}",
                      color: AppColors.success,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
