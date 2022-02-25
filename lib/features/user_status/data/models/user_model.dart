import 'package:wayve_test_app/core/enums/user_gender.dart';
import 'package:wayve_test_app/core/enums/user_status.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {int? id,
      String? name,
      String? email,
      UserGender? gender,
      UserStatus? status})
      : super(id: id, name: name, email: email, gender: gender, status: status);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
        email: json['email'] ?? "",
        gender: UserGender.values.byName(json['gender']),
        status: UserStatus.values.byName(json['status']));
  }
}
