import 'package:we_care/domain/orders/entities/order.dart';

class PaginationModel extends Pagination{
  const PaginationModel({super.total,super.currentPage,super.perPage,super.lastPage});

  factory PaginationModel.fromJson(Map<String, dynamic> json){
    return PaginationModel(
      total: json["total"],
      currentPage: json["current_page"],
      perPage: json["per_page"],
      lastPage: json["last_page"]
    );
  }
}