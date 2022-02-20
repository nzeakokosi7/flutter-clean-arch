import 'package:equatable/equatable.dart';
import 'package:wayve_test_app/core/enums/user_status.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? gender;
  final UserStatus? status;

  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status
});

  @override
  List<Object?> get props => [id, name, email, status];
}