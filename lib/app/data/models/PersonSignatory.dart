/// Name : "Hiren"
/// TaxNumber : "035.382.922-64"
/// Mail : "hiren@fitbank.com.br"
/// Phone : "8567867546"
/// BirthDate : "01/01/2001"
/// PersonRoleType : 1

class PersonSignatory {
  PersonSignatory({
      this.name, 
      this.taxNumber, 
      this.mail, 
      this.phone, 
      this.birthDate, 
      this.personRoleType,});

  PersonSignatory.fromJson(dynamic json) {
    name = json['Name'];
    taxNumber = json['TaxNumber'];
    mail = json['Mail'];
    phone = json['Phone'];
    birthDate = json['BirthDate'];
    personRoleType = json['PersonRoleType'];
  }
  String? name;
  String? taxNumber;
  String? mail;
  String? phone;
  String? birthDate;
  int? personRoleType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['TaxNumber'] = taxNumber;
    map['Mail'] = mail;
    map['Phone'] = phone;
    map['BirthDate'] = birthDate;
    map['PersonRoleType'] = personRoleType;
    return map;
  }

}