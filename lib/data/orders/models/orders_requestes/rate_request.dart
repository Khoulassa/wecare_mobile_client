import 'package:equatable/equatable.dart';

class RateRequest extends Equatable{
  final   int? orderId;
  final String? rate;
  final String? preview;
  const RateRequest ({ this.orderId,this.rate,this.preview});

  Map<String,dynamic> toJson(){
    return {"order_id": orderId.toString(),"rate":rate??"0","preview":preview??""};
  }

  @override

  List<Object?> get props => [orderId,rate,preview];

}