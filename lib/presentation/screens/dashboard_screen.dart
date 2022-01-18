import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:obsidan/controllers/account.controller.dart';
import 'package:obsidan/domain/models/account.dart';
import 'package:obsidan/presentation/widgets/expense_tile.dart';
import 'package:obsidan/utils/string_utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isLoading = false;
  Account account;

  @override
  void initState() {
    super.initState();
    setup();
  }

  setup() async {
    setState(() {
      _isLoading = true;
    });

    Account tmpAccount = await (new AccountController()).getAccount();

    setState(() {
      account = tmpAccount;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: FlatButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/images/Menu.svg",
            width: 50,
          ),
        ),
        actions: [
          FlatButton(
              onPressed: () {},
              child: SvgPicture.asset("assets/images/User.svg"))
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: EdgeInsets.only(
                top: 40,
                left: 16,
                right: 16,
              ),
              children: [
                Text(
                  "Current balance",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${StringUtil.currencySymbolToString(account.currentBalance.currency)} ${account.currentBalance.amount}',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Text(
                            "${StringUtil.currencySymbolToString(account.income.currency)} ${account.income.amount}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Container(
                        width: 1.5,
                        color: Colors.grey[400],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Text(
                            "${StringUtil.currencySymbolToString(account.spent.currency)} ${account.spent.amount}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Expenses"),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "View All",
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: account.expenses.map((expenses) {
                    return ExpenseTile(
                      expenses: expenses,
                    );
                  }).toList(),
                )
              ],
            ),
    );
  }
}
