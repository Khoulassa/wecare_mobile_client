import 'package:equatable/equatable.dart';

class Section extends Equatable {
 final int? id;
 final String? image;
  final String? name;

  const Section({this.id, this.image, this.name});

  @override

  List<Object?> get props =>[id,image,name];

}