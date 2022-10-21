/// Bank : null
/// BankBranch : null
/// BankAccount : null
/// BankAccountDigit : null
/// AccountKey : ""
/// SpbAccount : null

class Accounts {
  Accounts({
      this.bank, 
      this.bankBranch, 
      this.bankAccount, 
      this.bankAccountDigit, 
      this.accountKey, 
      this.spbAccount,});

  Accounts.fromJson(dynamic json) {
    bank = json['Bank'];
    bankBranch = json['BankBranch'];
    bankAccount = json['BankAccount'];
    bankAccountDigit = json['BankAccountDigit'];
    accountKey = json['AccountKey'];
    spbAccount = json['SpbAccount'];
  }
  dynamic bank;
  dynamic bankBranch;
  dynamic bankAccount;
  dynamic bankAccountDigit;
  String? accountKey;
  dynamic spbAccount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Bank'] = bank;
    map['BankBranch'] = bankBranch;
    map['BankAccount'] = bankAccount;
    map['BankAccountDigit'] = bankAccountDigit;
    map['AccountKey'] = accountKey;
    map['SpbAccount'] = spbAccount;
    return map;
  }

}