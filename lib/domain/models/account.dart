import 'package:obsidan/domain/models/balance.dart';
import 'package:obsidan/domain/models/expenses.dart';

class Account {
  Balance currentBalance;
  Balance income;
  Balance spent;
  List<Expenses> expenses;

  Account({this.currentBalance, this.income, this.spent, this.expenses});

  Account.fromJson(Map<String, dynamic> json) {
    currentBalance = json['currentBalance'] != null
        ? new Balance.fromJson(json['currentBalance'])
        : null;
    income = json['income'] != null
        ? new Balance.fromJson(json['income'])
        : null;
    spent = json['spent'] != null
        ? new Balance.fromJson(json['spent'])
        : null;
    if (json['expenses'] != null) {
      expenses = <Expenses>[];
      json['expenses'].forEach((v) {
        expenses.add(new Expenses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentBalance != null) {
      data['currentBalance'] = this.currentBalance.toJson();
    }
    if (this.income != null) {
      data['income'] = this.income.toJson();
    }
    if (this.spent != null) {
      data['spent'] = this.spent.toJson();
    }
    if (this.expenses != null) {
      data['expenses'] = this.expenses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

