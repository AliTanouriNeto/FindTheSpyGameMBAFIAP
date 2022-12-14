class User {
  String name = "";
  String mail = "";
  String password = "";
  bool keepOn = false;

  User(
      {required this.name,
      required this.mail,
      required this.password,
      required this.keepOn});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mail = json['mail'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['mail'] = mail;
    data['password'] = password;
    data['keepOn'] = keepOn;
    return data;
  }

  String toString() {
    return "Name: " +
        this.name +
        "\nE-mail: " +
        this.mail +
        "\nPassword: " +
        this.password;
  }
}
