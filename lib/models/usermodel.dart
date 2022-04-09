class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? displayName;

  UserModel(
      {this.email, this.firstName, this.lastName, this.uid, this.displayName});

  //recevied     data from server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      displayName: map['firstName'],
    );
  }

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'displayName': firstName,
    };
  }
}

class InfoModel {
  String? name;
  String? information;

  InfoModel({this.name, this.information});

  factory InfoModel.fromMap(map) {
    return InfoModel(
      name: map['name'],
      information: map['information'],
    );
  }

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'information': information,
    };
  }
}
