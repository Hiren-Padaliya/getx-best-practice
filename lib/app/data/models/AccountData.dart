import 'Accounts.dart';

/// Identifier : "927361"
/// TaxNumber : "30934646000107"
/// Name : "[BU] Josué Almeida Ramos"
/// TradingName : "[BU] Josué Almeida Ramos"
/// Nickname : null
/// Mail : "josue.ramos@gmail.com.br"
/// Phone : "(99) 99999-9999"
/// Accounts : [{"Bank":null,"BankBranch":null,"BankAccount":null,"BankAccountDigit":null,"AccountKey":"","SpbAccount":null}]

class AccountData {
  AccountData({
      this.identifier, 
      this.taxNumber, 
      this.name, 
      this.tradingName, 
      this.nickname, 
      this.mail, 
      this.phone, 
      this.accounts,});

  AccountData.fromJson(dynamic json) {
    identifier = json['Identifier'];
    taxNumber = json['TaxNumber'];
    name = json['Name'];
    tradingName = json['TradingName'];
    nickname = json['Nickname'];
    mail = json['Mail'];
    phone = json['Phone'];
    if (json['Accounts'] != null) {
      accounts = [];
      json['Accounts'].forEach((v) {
        accounts?.add(Accounts.fromJson(v));
      });
    }
  }
  String? identifier;
  String? taxNumber;
  String? name;
  String? tradingName;
  dynamic nickname;
  String? mail;
  String? phone;
  List<Accounts>? accounts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Identifier'] = identifier;
    map['TaxNumber'] = taxNumber;
    map['Name'] = name;
    map['TradingName'] = tradingName;
    map['Nickname'] = nickname;
    map['Mail'] = mail;
    map['Phone'] = phone;
    if (accounts != null) {
      map['Accounts'] = accounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}