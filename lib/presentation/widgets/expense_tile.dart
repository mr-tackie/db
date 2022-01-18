import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:obsidan/domain/models/expenses.dart';
import 'package:obsidan/utils/string_utils.dart';

class ExpenseTile extends StatelessWidget {
  final Expenses expenses;

  const ExpenseTile({
    Key key,
    this.expenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String asset = "";

    switch (expenses.type) {
      case "Bills":
        asset = "assets/images/Bill.svg";
        break;
      case "Transport":
        asset = "assets/images/Transport.svg";
        break;
      case "Shopping":
        asset = "assets/images/Shopping.svg";
        break;
      default:
        break;
    }
    
    return ListTile(
      leading: SvgPicture.asset(asset),
      title: Text(
        expenses.type,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "12 minutes ago",
      ),
      trailing: Text("-${StringUtil.currencySymbolToString(expenses.currency)} ${expenses.amount}"),
    );
  }
}
