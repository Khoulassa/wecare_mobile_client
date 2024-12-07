import 'package:equatable/equatable.dart';

class Nationality extends Equatable {
 final int? id;
  final String? name;

 const Nationality({this.id, this.name});

  @override

  List<Object?> get props => [id,name];}