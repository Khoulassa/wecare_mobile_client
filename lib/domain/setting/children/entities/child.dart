import 'package:equatable/equatable.dart';

class AChild extends Equatable  {
 final int? id;
 final String? name;
final  String? gender;
final  String? needs;
final  String? birthDate;
final  int? age;

  const AChild({this.age,this.birthDate,this.needs,this.gender,this.name,this.id});

  @override
  List<Object?> get props => [id,name,gender,needs,birthDate,age];

}