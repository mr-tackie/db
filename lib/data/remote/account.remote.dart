import 'dart:convert';

import 'package:obsidan/domain/models/account.dart';
import 'package:http/http.dart' as http;

class AccountRemoteRepository{
  Future<Account> getAccount() async {
    http.Response response = await http.get("https://my-json-server.typicode.com/obsidian-achernar/interview-db/db");

    if(response.statusCode == 200){
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      return Account.fromJson(jsonResponse);
    }

    throw new Exception("Could not retrieve data");
  }
}