import 'package:equatable/equatable.dart';


class FilterServicesRequest extends Equatable{
final  int? id ;
final String term;
 final String? filter;
  const FilterServicesRequest({this.id,this.filter,this.term=""});

   Map<String,String> toJson(){
    return {
     "section_id": id.toString() ,"filter":filter??"","term":"a"
    };
   }


  @override
  // TODO: implement props
  List<Object?> get props => [id,filter];
}