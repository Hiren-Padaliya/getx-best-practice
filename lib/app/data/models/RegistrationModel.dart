import 'Person.dart';

/// Method : "LimitedAccount"
/// PartnerId : 606
/// BusinessUnitId : 629
/// Name : "TestName"
/// Nickname : "Testing"
/// Phone : "8567867546"
/// BirthDate : "01/01/2001"
/// TaxNumber : "10.533.345/0001-64"
/// Mail : "test@fitbank.com.br"
/// Bank : "621"
/// BankBranch : "3212"
/// BankAccount : "51351"
/// BankAccountDigit : "5"
/// LegalName : "TestCompany"
/// ConstitutionDate : "02/06/2002"
/// Person : [{"Name":"Hiren","TaxNumber":"035.382.922-64","Mail":"hiren@fitbank.com.br","Phone":"8567867546","BirthDate":"01/01/2001","PersonRoleType":1}]

class RegistrationModel {
  RegistrationModel({
      this.method, 
      this.partnerId, 
      this.businessUnitId, 
      this.name, 
      this.nickname, 
      this.phone, 
      this.birthDate, 
      this.taxNumber, 
      this.mail, 
      this.bank, 
      this.bankBranch, 
      this.bankAccount, 
      this.bankAccountDigit, 
      this.legalName, 
      this.constitutionDate, 
      this.person,});

  RegistrationModel.fromJson(dynamic json) {
    method = json['Method'];
    partnerId = json['PartnerId'];
    businessUnitId = json['BusinessUnitId'];
    name = json['Name'];
    nickname = json['Nickname'];
    phone = json['Phone'];
    birthDate = json['BirthDate'];
    taxNumber = json['TaxNumber'];
    mail = json['Mail'];
    bank = json['Bank'];
    bankBranch = json['BankBranch'];
    bankAccount = json['BankAccount'];
    bankAccountDigit = json['BankAccountDigit'];
    legalName = json['LegalName'];
    constitutionDate = json['ConstitutionDate'];
    if (json['Person'] != null) {
      person = [];
      json['Person'].forEach((v) {
        person?.add(Person.fromJson(v));
      });
    }
  }
  String? method;
  int? partnerId;
  int? businessUnitId;
  String? name;
  String? nickname;
  String? phone;
  String? birthDate;
  String? taxNumber;
  String? mail;
  String? bank;
  String? bankBranch;
  String? bankAccount;
  String? bankAccountDigit;
  String? legalName;
  String? constitutionDate;
  List<Person>? person;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Method'] = method;
    map['PartnerId'] = partnerId;
    map['BusinessUnitId'] = businessUnitId;
    map['Name'] = name;
    map['Nickname'] = nickname;
    map['Phone'] = phone;
    map['BirthDate'] = birthDate;
    map['TaxNumber'] = taxNumber;
    map['Mail'] = mail;
    map['Bank'] = bank;
    map['BankBranch'] = bankBranch;
    map['BankAccount'] = bankAccount;
    map['BankAccountDigit'] = bankAccountDigit;
    map['LegalName'] = legalName;
    map['ConstitutionDate'] = constitutionDate;
    if (person != null) {
      map['Person'] = person?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}