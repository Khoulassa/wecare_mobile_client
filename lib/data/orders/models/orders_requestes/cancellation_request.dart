import 'package:equatable/equatable.dart';

class CancellationRequest extends Equatable{
final   int orderId;
final String? reason;
const CancellationRequest({required this.orderId,this.reason});

  Map<String,dynamic> toJson(){
  return {
    "order_id":orderId.toString(),
    "reason":reason??"",
  };
}

  @override

  List<Object?> get props => [orderId,reason];

}