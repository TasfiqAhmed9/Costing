// ignore_for_file: file_names

class UserModel {
  final String uId;
  final String username;
  final String email;
  final String phone;
  final String userImg;
  final String country;
  final String userDeviceToken;
  final dynamic createdOn;

  UserModel({
    required this.uId,
    required this.username,
    required this.email,
    required this.phone,
    required this.userImg,
    required this.country,
    required this.userDeviceToken,
    required this.createdOn,
  });

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'username': username,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'country': country,
      'userDeviceToken': userDeviceToken,
      'createdOn': createdOn,
    };
  }

  // Create a UserModel instance from a JSON map
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      userImg: json['userImg'],
      country: json['country'],
      userDeviceToken: json['userDeviceToken'],
      createdOn: json['createdOn'].toString(),
    );
  }
}
