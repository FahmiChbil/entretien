import 'package:entretien/entretien/models/allMobiles.dart';
import 'package:entretien/entretien/service/api.dart';
import 'package:flutter/material.dart';

class Employees extends StatefulWidget {
  Employees({super.key, required AllMobiles allMobiles});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  String title = "mohamed";
  String title2 = "Employee";
  String imei = "";
  String idtel = "";
  String idemp = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Affectation"),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "phone name",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              FutureBuilder(
                future: Api().getMobiles(),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text("$title"),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            ...List.generate(
                              snapshot.data!.allMobiles.length,
                              (index) => PopupMenuItem(
                                child:
                                    Text(snapshot.data!.allMobiles[index].nom!),
                                value:
                                    "${snapshot.data!.allMobiles[index].nom},${snapshot.data!.allMobiles[index].num},${snapshot.data!.allMobiles[index].idtel}",
                              ),
                            )

                            // PopupMenuItem(
                            //   child: Text("item2"),
                            //   value: item2,
                            // ),
                            // PopupMenuItem(
                            //   child: Text("item3"),
                            //   value: item3,
                            // )
                          ],
                          onSelected: (value) {
                            setState(() {
                              List<String> list = value.split(',');
                              title = list.first;
                              imei = list[1];
                              idtel = list.last;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          height: 60,
                          width: 400,
                          color: Colors.grey.shade400,
                          child: Center(child: Text("$imei")),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Employee",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              FutureBuilder(
                future: Api().getEmployees(),
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("$title2"),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            ...List.generate(
                              snapshot.data!.allEmployee.length,
                              (index) => PopupMenuItem(
                                child: Text(
                                    snapshot.data!.allEmployee[index].nom!),
                                value:
                                    "${snapshot.data!.allEmployee[index].nom},${snapshot.data!.allEmployee[index].idperson}",
                              ),
                            )

                            // PopupMenuItem(
                            //   child: Text("item2"),
                            //   value: item2,
                            // ),
                            // PopupMenuItem(
                            //   child: Text("item3"),
                            //   value: item3,
                            // )
                          ],
                          onSelected: (value) {
                            setState(() {
                              List<String> list = value.split(',');
                              title2 = list.first;
                              idemp = list.last;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              )),
                            ),
                            onPressed: () async {
                              print("id tel : $idtel");
                              print(("$idemp"));
                              await Api()
                                  .affect(int.parse(idtel), int.parse(idemp));
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  );
                },
              ),
            ],
          )),
    );
  }
}
