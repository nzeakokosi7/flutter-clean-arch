import 'package:equatable/equatable.dart';
import 'package:wayve_test_app/core/enums/server_error_types.dart';

class ServerErrorModel extends Equatable {
  final int? statusCode;
  final String? errorMessage;
  final dynamic data;
  final ServerErrorTypes type;

  const ServerErrorModel({
    this.statusCode,
    this.errorMessage,
    this.data,
    this.type = ServerErrorTypes.response,
  });

  @override
  List<Object> get props => [errorMessage!];

  @override
  bool get stringify => true;
}
