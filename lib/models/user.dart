class User {
  String _username;
  String _password;
  User(this._username, this._password);

  User.map(dynamic obj) {
    this._username = obj["userName"];
    this._password = obj["password"];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["userName"] = _username;
    map["password"] = _password;

    return map;
  }
}