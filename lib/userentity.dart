import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        userName: json['userName'] ?? "",
        email: json['email'] ?? "",
        password: json['password'] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'email': email,
        'password': password,
      };
  factory UserEntity.empty() => const UserEntity(
        userName: "",
        email: "",
        password: "",
      );
  @override
  List<Object?> get props => [userName, email, password];
}
