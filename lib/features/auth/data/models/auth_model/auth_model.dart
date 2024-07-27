import 'package:equatable/equatable.dart';

import 'tokens.dart';
import 'user.dart';

class AuthModel extends Equatable {
  final User? user;
  final Tokens? tokens;

  const AuthModel({this.user, this.tokens});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        tokens: json['tokens'] == null
            ? null
            : Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'tokens': tokens?.toJson(),
      };

  @override
  List<Object?> get props => [user, tokens];
}
