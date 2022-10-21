/// id : 1
/// Firstname : "Hiren"
/// Lastname : "Padaliya"
/// email : "hiren@gmail.com"
/// active : true
/// token:"ascasdad232cascaw3433ca"

class UserData {
  UserData({
      this.id, 
      this.firstname, 
      this.lastname, 
      this.email, 
      this.active,
      this.token});

  UserData.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['Firstname'];
    lastname = json['Lastname'];
    email = json['email'];
    active = json['active'];
    token = json['token'];
  }
  num? id;
  String? firstname;
  String? lastname;
  String? email;
  bool? active;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['Firstname'] = firstname;
    map['Lastname'] = lastname;
    map['email'] = email;
    map['active'] = active;
    map['token'] = token;
    return map;
  }

}