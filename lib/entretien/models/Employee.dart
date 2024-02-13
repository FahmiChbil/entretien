class Employee {
  final int idperson;
  final String nom;
  final String prenom;
  final String mail;
  final String? password;
  final String username;

  Employee(
      {required this.idperson,
      required this.nom,
      required this.prenom,
      required this.mail,
      required this.password,
      required this.username});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      idperson: json['idperson'],
      nom: json['nom'],
      prenom: json['prenom'],
      mail: json['mail'],
      password: json['password'] != null ? json['password'] : null,
      username: json['username'],
    );
  }
}
