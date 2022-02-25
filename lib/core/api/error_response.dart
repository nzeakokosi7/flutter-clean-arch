class ErrorResponse {
  bool success;
  String message;
  dynamic data;

  ErrorResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    //`data` can come as String, List, Map or null
    dynamic dataObj;

    if (json['data'] != null) {
      dynamic d = json["data"];

      switch (d.runtimeType) {
        case String:
          dataObj = d;
          break;
        case List:
          dataObj = null;
          break;
        case Map:
          dataObj = d;
          break;
        default:
          dataObj = null;
      }
    }

    return ErrorResponse(
      success: json["success"] as bool,
      message: json["message"] as String,
      data: dataObj,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}
