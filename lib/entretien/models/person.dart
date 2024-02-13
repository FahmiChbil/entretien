class Person {
  late int idperson;
  late String nom;
  late String prenom;
  late String username;

  Person(
      {required this.idperson,
      required this.nom,
      required this.prenom,
      required this.username});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      idperson: json['idperson'] as int,
      nom: json['nom'],
      prenom: json['prenom'],
      username: json['username'],
    );
  }
}
