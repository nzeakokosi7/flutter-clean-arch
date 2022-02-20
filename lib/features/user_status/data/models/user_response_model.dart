import 'package:wayve_test_app/features/user_status/data/models/user_model.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_response_entity.dart';

class UserResponseModel extends UserResponseEntity {

  const UserResponseModel({
    required _Meta metaData,
    required UserModel userModel,
  }): super(metaData: metaData, userEntity: userModel);

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
        metaData: json['meta'],
        userModel: json["data"]
    );
  }
}

class _Meta extends MetaEntity{

  const _Meta({
    required _Pagination pagination
  }) : super(pagination: pagination);

  factory _Meta.fromJson(Map<String, dynamic> json) {
    return _Meta(
        pagination: json['pagination'],
    );
  }
}

class _Pagination extends PaginationEntity {

  const _Pagination({
    required int total,
    required int pages,
    required int page,
    required int limit
  }) : super(total: total, pages: pages, page: page, limit: limit);

  factory _Pagination.fromJson(Map<String, dynamic> json) {
    return _Pagination(
        total: json['total'],
        pages: json['pages'],
        page: json['page'],
        limit: json['limit'],
    );
  }
}