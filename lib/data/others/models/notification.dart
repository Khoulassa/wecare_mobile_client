import 'package:we_care/domain/other/entities/notification.dart';


class NotificationModel extends ANotification {
  const NotificationModel(
      {super.time,
      super.date,
      super.notificationId,
      super.body,
      super.title,
      super.notificationType,
      super.id});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        notificationId: json["notificationable_id"],
        title: json["title"],
        body:json["body"] ,
        notificationType: json["notificationable_type"],
        date: json["date"],
        time: json["time"],
        id: json["id"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": notificationId,
      "notificationable_type": notificationType,
      "notificationable_id": notificationId,
      "title": title,
      "date": date,
      "time": time,
    };
  }
}
