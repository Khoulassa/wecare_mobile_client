

import 'package:equatable/equatable.dart';
import 'package:we_care/domain/other/entities/city.dart';

class Address extends Equatable{
 final int? id;
 final String? name;
 final City? city;
 final String? state;
 final String? street;
 final String? buildingNo;
final  String? flatNo;
final  String? postcode;
  final String? mainMobile;
 final String? subMobile;

  const Address(
      {this.id,
        this.city,
        this.state,
        this.name,
        this.street,
        this.buildingNo,
        this.flatNo,
        this.mainMobile,
        this.postcode,
        this.subMobile});

  @override

  List<Object?> get props => [id,city,state,name,street,buildingNo,flatNo,mainMobile,postcode,subMobile];


}