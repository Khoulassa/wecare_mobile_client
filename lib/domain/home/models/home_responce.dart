import 'package:we_care/domain/home/models/bannar.dart';
import 'package:we_care/domain/home/models/share.dart';
import 'package:we_care/domain/services/entities/service.dart';

class HomePage {
  List<HBanner>? banners;
  List<ServiceM>? services;
  Share?share;
  HomePage({this.banners, this.services,this.share});
}