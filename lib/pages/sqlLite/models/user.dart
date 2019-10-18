class User {
  String _userName;
  String _password;

  User(this._userName, this._password);

  User.map(dynamic obj) {
    this._userName = obj['userName'];
    this._password = obj['password'];
  }

  String get userName => _userName;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['userName'] = _userName;
    map['password'] = _password;

    return map;
  }
}
