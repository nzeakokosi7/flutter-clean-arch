import 'package:equatable/equatable.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';

class UserResponseEntity extends Equatable {
  final MetaEntity metaData;
  final List<UserEntity> userEntities;

  const UserResponseEntity({
    required this.metaData,
    required this.userEntities,
  });

  @override
  List<Object> get props => [metaData, userEntities];
}

class MetaEntity extends Equatable {
  final PaginationEntity pagination;

  const MetaEntity({required this.pagination});

  @override
  List<Object> get props => [pagination];
}

class PaginationEntity extends Equatable {
  final int total;
  final int pages;
  final int page;
  final int limit;
  final LinkEntity links;

  const PaginationEntity(
      {required this.total,
      required this.pages,
      required this.page,
      required this.limit,
      required this.links});

  @override
  List<Object> get props => [total, pages, page, limit, links];
}

class LinkEntity extends Equatable {
  final String? previous;
  final String current;
  final String? next;

  const LinkEntity({
    this.previous,
    required this.current,
    this.next,
  });

  @override
  List<Object> get props => [previous!, current, next!];
}
