import 'package:entretien/entretien/models/mobile.dart';

class AllMobiles {
  late List<Mobile> allMobiles;
  AllMobiles({required this.allMobiles});
  factory AllMobiles.fromjson(List list) {
    return AllMobiles(
        allMobiles: List.from(list.map((e) => Mobile.fromJson(e))));
  }
}
