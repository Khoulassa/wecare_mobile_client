class AppConstants {
  static const int responseCodeSuccess = 200;
  static const int errorNoConnectionCode = 1000;
  static const int errorNoBodyParsingCode = 2000;
  static const String baseUrl = "https://srv645221.hstgr.cloud";
  static const String keyAccessUuid = "uuid";
  static const String keyAccessToken = "token";
  static const String deviceToken = "deviceToken";
  static const String hasToken = "hasToken";
  static const String lang = "lang";

  /// =======notification types ================///
  static const String fireTypAccepted = "user_order_accepted";
  static const String fireTypRejected = "user_order_rejected";
  static const String fireTypeCompleted = "user_order_completed";
  static const String fireTypeCanceled =  "user_order_canceled";

  /// =======orders types ================///
  static const String currentOrderEn = "Current";
  static const String inProgressOrder="in_progress";
  static const String currentOrderAr = "حالية";
  static const String completedOrderEn = "Completed";
  static const String completedOrder = "completed";
  static const String completedOrderAr = "مكتملة";
  static const String canceledOrderEn = "Canceled";
  static const String canceledOrder = "canceled";
  static const String canceledOrderAr = "ملغية";
  static const String rejectedOrderEn = "Rejected";
  static const String rejectedOrder = "rejected";
  static const String rejectedOrderAr = "مرفوضة";
  static const String waitingOrderEn = "ًWaiting";
  static const String waitingOrderAr = "في الانتظار";
  static const String waitingOrder="waiting";

  static const String refusedOrder="refused";
}
