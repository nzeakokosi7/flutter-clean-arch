import 'package:wayve_test_app/features/user_status/data/models/user_model.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_response_entity.dart';

class UserResponseModel extends UserResponseEntity {
  const UserResponseModel({
    required Meta metaData,
    required List<UserModel> users,
  }) : super(metaData: metaData, userEntities: users);

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
        metaData: Meta.fromJson(json['meta']),
        users:
            json["data"].map<UserModel>((i) => UserModel.fromJson(i)).toList());
  }
}

class Meta extends MetaEntity {
  const Meta({required Pagination pagination}) : super(pagination: pagination);

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Pagination extends PaginationEntity {
  const Pagination(
      {required int total,
      required int pages,
      required int page,
      required int limit,
      required Link links})
      : super(
            total: total, pages: pages, page: page, limit: limit, links: links);

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
        total: json['total'] ?? 0,
        pages: json['pages'] ?? 0,
        page: json['page'] ?? 0,
        limit: json['limit'] ?? 0,
        links: Link.fromJson(json["links"]));
  }
}

class Link extends LinkEntity {
  const Link({
    required String previous,
    required String current,
    required String next,
  }) : super(previous: previous, current: current, next: next);

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      previous: json['previous'].toString(),
      current: json['current'].toString(),
      next: json['next'].toString(),
    );
  }
}
