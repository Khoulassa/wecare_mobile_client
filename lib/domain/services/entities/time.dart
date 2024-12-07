import 'package:equatable/equatable.dart';

class Times extends Equatable {
  final List? morning;
  final List? night;
  final bool? hasNightSift;

  const Times({this.hasNightSift, this.morning, this.night});

  @override
  List<Object?> get props => [morning, night, hasNightSift];
}
