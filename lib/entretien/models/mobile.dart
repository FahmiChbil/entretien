import 'package:entretien/entretien/models/person.dart';

class Mobile {
  late int? idtel;
  late String? num;
  late String? nom;

  late Person? person;

  Mobile(
      {required this.idtel,
      required this.num,
      required this.nom,
      required this.person});

  factory Mobile.fromJson(Map<String, dynamic> json) {
    return Mobile(
        idtel: json['idtel'] != null ? json['idtel'] as int : null,
        num: json['num'] != null ? json['num'] : null,
        nom: json['nom'],
        person:
            json['person'] != null ? Person.fromJson(json['person']) : null);
  }
}
