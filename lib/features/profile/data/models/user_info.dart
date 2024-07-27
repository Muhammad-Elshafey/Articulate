import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String? username;
  final String? name;
  final String? email;
  final String? profilePicture;
  final String? phoneNumber;

  const UserInfo({
    this.username,
    this.name,
    this.email,
    this.profilePicture,
    this.phoneNumber,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        username: json['username'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        profilePicture: json['profile_picture'] as String?,
        phoneNumber: json['phone_number'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'name': name,
        'email': email,
        'profile_picture': profilePicture,
        'phone_number': phoneNumber,
      };

  @override
  List<Object?> get props {
    return [
      username,
      name,
      email,
      profilePicture,
      phoneNumber,
    ];
  }
}
