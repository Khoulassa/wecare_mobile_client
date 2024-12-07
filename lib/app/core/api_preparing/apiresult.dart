class APIResult {
  bool hasError = false;
  dynamic data;
  String? message;

}
class DynamicResponse {
  bool? status;
  dynamic data;
  String? error;
  String? message;

  DynamicResponse({this.data, this.error, this.message, this.status});

  factory DynamicResponse.fromJson(Map<String, dynamic> json) {
    return DynamicResponse(
        data: json["data"],
        error: json["error"],
        message: json["message"],
        status: json["status"]);
  }
}