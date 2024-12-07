import 'package:equatable/equatable.dart';

class RateServiceRequest extends Equatable{
    String? serviceId ;
   String? rate;
   String? orderId;
   RateServiceRequest( {this.serviceId,this.rate,this.orderId});

  Map<String,String> toJson(){
    return {
      "service_id": serviceId!, "rate": rate??"0","order_id":orderId!
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [serviceId,rate,orderId];



}