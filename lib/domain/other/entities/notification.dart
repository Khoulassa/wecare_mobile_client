import 'package:equatable/equatable.dart';

class ANotification  extends Equatable{
 final int? id;
final  String? title;
final  String? body;
final  String? notificationType;
final  String? notificationId;
final  String? date;
final  String? time;

  const ANotification(
      {this.id,
        this.title,
        this.body,
        this.notificationId,
        this.notificationType,
        this.date,
        this.time});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,body,notificationType,notificationId,date,time];


}