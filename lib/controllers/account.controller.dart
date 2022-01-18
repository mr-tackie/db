import 'package:obsidan/data/remote/account.remote.dart';
import 'package:obsidan/domain/models/account.dart';

class AccountController{
  Future<Account> getAccount() async {
    return await (new AccountRemoteRepository()).getAccount();
  }
}