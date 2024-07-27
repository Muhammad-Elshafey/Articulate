import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final bool? emailVerified;
  final String? profilePicture;
  final String? phoneNumber;

  const User({
    this.phoneNumber,
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerified,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        emailVerified: json['email_verified'] as bool?,
        profilePicture: json['profile_picture'] as String?,
        phoneNumber: json['phone_number'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'email_verified': emailVerified,
        'profile_picture': profilePicture,
        'phone_number': phoneNumber,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      username,
      email,
      emailVerified,
      profilePicture,
      phoneNumber,
    ];
  }
}
