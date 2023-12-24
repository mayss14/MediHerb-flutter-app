class UserModel {
  String username;
   String uid;
  String email;
 

  UserModel({
    required this.username,
    required this.uid,
    required this.email,
    
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',

    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "uid": uid,
      "email": email,
     
    };
  }
}
