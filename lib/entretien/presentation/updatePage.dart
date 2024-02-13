import 'package:entretien/entretien/service/api.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({super.key});
  static String route = "myroute";

  TextEditingController nom = TextEditingController();

  TextEditingController num = TextEditingController();

  TextEditingController id = TextEditingController();
  TextEditingController deletedId = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Form(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: id,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    hintText: "id",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nom,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    hintText: "nom",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: num,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    hintText: "num",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Api().cretaeUser(nom.text, num.text);
                      },
                      child: Text("create user")),
                  ElevatedButton(
                      onPressed: () {
                        Api()
                            .updateUser(int.parse(id.text), nom.text, num.text);
                      },
                      child: Text("update user")),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: deletedId,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    hintText: "id",
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Api().updateUser(
                        int.parse(deletedId.text), nom.text, num.text);
                  },
                  child: Text("delete user")),
            ],
          )),
        ),
      ),
    );
  }
}
