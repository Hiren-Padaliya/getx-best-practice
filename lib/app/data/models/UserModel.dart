import 'AccountData.dart';

/// Success : "true"
/// AccountData : {"Identifier":"927361","TaxNumber":"30934646000107","Name":"[BU] Josué Almeida Ramos","TradingName":"[BU] Josué Almeida Ramos","Nickname":null,"Mail":"josue.ramos@gmail.com.br","Phone":"(99) 99999-9999","Accounts":[{"Bank":null,"BankBranch":null,"BankAccount":null,"BankAccountDigit":null,"AccountKey":"","SpbAccount":null}]}

class UserModel {
  UserModel({
      this.success,
      this.accountData,});

  UserModel.fromJson(dynamic json) {
    success = json['Success'];
    accountData = json['AccountData'] != null ? AccountData.fromJson(json['AccountData']) : null;
  }
  String? success;
  String? Message;
  AccountData? accountData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Success'] = success;
    if (accountData != null) {
      map['AccountData'] = accountData?.toJson();
    }
    return map;
  }

}