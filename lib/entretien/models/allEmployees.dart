import 'package:entretien/entretien/models/Employee.dart';

class AllEmployees {
  late List<Employee> allEmployee;
  AllEmployees({required this.allEmployee});
  factory AllEmployees.fromjson(List list) {
    return AllEmployees(
        allEmployee: List.from(list.map((e) => Employee.fromJson(e))));
  }
}
