import 'package:equatable/equatable.dart';

class Tokens extends Equatable {
  final String? access;

  const Tokens({this.access});

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: json['access'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'access': access,
      };

  @override
  List<Object?> get props => [access];
}
