import 'package:equatable/equatable.dart';

class AProvider extends Equatable {
final  int? id;
 final String? name;
final  String? image;
final  int? rate;

  const AProvider( {this.id, this.name, this.image,this.rate});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name,image,rate];


}