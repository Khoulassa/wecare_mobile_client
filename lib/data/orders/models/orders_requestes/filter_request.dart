import 'package:equatable/equatable.dart';

class FilterRequest extends Equatable{
  final   int? page;
  final String? term;
  final String? type;
  const FilterRequest ({ this.page,this.term,this.type});

  Map<String,String> toJson(){
    return {
      "page": page.toString()??"", "type": type??"", "term": term??""
    };
  }

  @override

  List<Object?> get props => [page,type,term];

}