class UserData {
  String uid;
  String firstName;
  String lastName;
  String email;
  String adress;
  String phoneNumber;

  UserData({
    this.uid,
    this.firstName,
    this.email,
    this.lastName,
    this.adress,
    this.phoneNumber,
  });

  factory UserData.fromMap(Map data) {
    return UserData(
      uid: data['uid'],
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      adress: data['adress'],
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }
}

class Chef {
  String uid;
  String name;

  Chef({this.uid, this.name});

  factory Chef.fromMap(Map data) {
    return Chef(
      uid: data['uid'],
      name: data['name'],
    );
  }
}
