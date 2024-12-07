import 'package:equatable/equatable.dart';

class City extends Equatable{
 //TODO change to int
 final int? id;
 final String? name;

  const City({this.id, this.name});

  @override

  List<Object?> get props => [id,name];}