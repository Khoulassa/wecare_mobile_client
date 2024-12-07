import 'package:equatable/equatable.dart';


class HomeServicesRequest extends Equatable{
  final  int? cityId ;
  final int page;

  const HomeServicesRequest ({this.cityId,required this.page});

  Map<String,String> toJson(){
    return cityId !=null? {
      "city_id": cityId.toString() ,"page":page.toString()
    }:{
      "page":page.toString()
    };
  }


  @override

  List<Object?> get props => [cityId,page];
}