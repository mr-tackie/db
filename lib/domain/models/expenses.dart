
class Expenses {
  String type;
  int amount;
  String currency;

  Expenses({this.type, this.amount, this.currency});

  Expenses.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}