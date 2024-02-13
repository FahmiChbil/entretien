import 'dart:convert';

import 'package:entretien/entretien/exception/exception.dart';
import 'package:entretien/entretien/models/allEmployees.dart';
import 'package:entretien/entretien/models/allMobiles.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<AllMobiles> getMobiles() async {
    final response =
        await http.get(Uri.parse('http://63.250.52.98:9305/mobiles'));

    if (response.statusCode == 200) {
      List decodedJson = jsonDecode(response.body);
      AllMobiles allmobiles = AllMobiles.fromjson(decodedJson);

      return allmobiles;
    } else {
      throw ServerException();
    }
  }

  Future<http.Response> cretaeUser(String nom, String num) {
    return http.post(
      Uri.parse('http://63.250.52.98:9305/mobiles/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"nom": nom, "num": num}),
    );
  }

  Future<http.Response> updateUser(int id, String nom, String num) {
    return http.put(
      Uri.parse('http://63.250.52.98:9305/mobiles/upmobile/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"nom": nom, "num": num}),
    );
  }

  Future<http.Response> deleteData(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://63.250.52.98:9305/mobiles/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

  Future<AllEmployees> getEmployees() async {
    final response =
        await http.get(Uri.parse('http://63.250.52.98:9305/persons'));

    if (response.statusCode == 200) {
      List decodedJson = jsonDecode(response.body);
      AllEmployees allEmployees = AllEmployees.fromjson(decodedJson);

      return allEmployees;
    } else {
      throw ServerException();
    }
  }

  Future<http.Response> affect(
    int idtel,
    int idEmp,
  ) {
    return http.put(
      Uri.parse('http://63.250.52.98:9305/mobiles/${idtel}/${idEmp}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
