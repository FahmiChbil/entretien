import 'package:entretien/entretien/presentation/employees.dart';
import 'package:entretien/entretien/presentation/updatePage.dart';
import 'package:entretien/entretien/service/api.dart';
import 'package:flutter/material.dart';

class MobilesPage extends StatelessWidget {
  MobilesPage({super.key});

  TextEditingController nom = TextEditingController();

  TextEditingController num = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mobiles"),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "nom",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "prenom",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "username",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FutureBuilder(
                    future: Api().getMobiles(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            ...List.generate(
                              snapshot.data!.allMobiles.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Employees(
                                            allMobiles: snapshot.data!),
                                      ));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      snapshot.data!.allMobiles[index].nom!,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      snapshot.data!.allMobiles[index].person ==
                                              null
                                          ? "-"
                                          : snapshot.data!.allMobiles[index]
                                              .person!.prenom,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      snapshot.data!.allMobiles[index].person ==
                                              null
                                          ? "-"
                                          : snapshot.data!.allMobiles[index]
                                              .person!.username,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 125,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateUser()),
                                );
                              },
                              child: Text("update user")),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
