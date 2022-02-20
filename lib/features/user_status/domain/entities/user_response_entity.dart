import 'package:equatable/equatable.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';

class UserResponseEntity extends Equatable {
  final MetaEntity metaData;
  final UserEntity userEntity;

  const UserResponseEntity({
     required this.metaData,
     required this.userEntity,
  });

  @override
  List<Object> get props => [metaData, userEntity];
}

class MetaEntity extends Equatable {
  final PaginationEntity pagination;

  const MetaEntity({
    required this.pagination
  });

  @override
  List<Object> get props => [pagination];
}

class PaginationEntity extends Equatable {
  final int total;
  final int pages;
  final int page;
  final int limit;

  const PaginationEntity({
    required this.total,
    required this.pages,
    required this.page,
    required this.limit
  });

  @override
  List<Object> get props => [total, pages, page, limit];
}