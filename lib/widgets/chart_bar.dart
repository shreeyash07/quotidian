import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPecOfTotoal;

  ChartBar(this.label, this.spendingAmount, this.spendingPecOfTotoal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: constraints.maxWidth * 0.15,
              child: FittedBox(
                child: Text('Rs.${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.05,
            ),
            Container(
                width: constraints.maxWidth * 0.6,
                height: 10,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 15,
                        ),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: spendingPecOfTotoal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: constraints.maxWidth * 0.05,
            ),
            Container(
              width: constraints.maxWidth * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
