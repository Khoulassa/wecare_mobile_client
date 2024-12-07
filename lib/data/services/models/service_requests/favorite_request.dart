import 'package:equatable/equatable.dart';

class FavoriteRequest extends Equatable{
  final  int? id ;
  final String? type;
  const FavoriteRequest({this.id,this.type});

  Map<String,String> toJson(){
    return {
      "service_id": id.toString(), "type": type??""
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,type];



}