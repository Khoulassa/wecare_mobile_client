import 'package:equatable/equatable.dart';
import 'package:we_care/domain/other/entities/city.dart';
import 'package:we_care/domain/services/entities/time.dart';

class ServiceM extends Equatable {
final  int? id;
final  int? rate;
final  City? city;
final  Times? times;
final  String? name;
final  String? image;
 final String? providerName;
 final String? descriptionAr;
 final String? descriptionEn;
final  String? price;
 final bool? isFave;

  const ServiceM(
      {this.id,
        this.image,
        this.descriptionAr,
        this.name,
        this.price,
        this.rate,
        this.isFave,
        this.providerName,
        this.city,
        this.descriptionEn,
        this.times});

  @override
  // TODO: implement props
  List<Object?> get props =>  [id,rate,city,times,name,image,providerName,descriptionAr,descriptionEn,price,isFave];




}