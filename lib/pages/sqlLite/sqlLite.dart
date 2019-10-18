import 'package:flutter/material.dart';
import 'package:hello_world/pages/sqlLite/data/database_helper.dart';
import 'package:hello_world/pages/sqlLite/data/rest_data.dart';
import 'package:hello_world/pages/sqlLite/models/user.dart';

class SqlLiteScreen extends StatefulWidget {
  const SqlLiteScreen({Key key}) : super(key: key);

  @override
  _SqlLiteScreenState createState() => _SqlLiteScreenState();
}

class _SqlLiteScreenState extends State<SqlLiteScreen> {
  BuildContext _ctx;
  bool _isLoading;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  RestData api = new RestData();

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.green,
    );

    var loginform = new Column(
      children: <Widget>[
        Text(
          "SqfLite App login",
          textScaleFactor: 2,
        ),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: InputDecoration(
                    labelText: "UserName",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ),
            ],
          ),
        ),
        loginBtn,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      key: scaffoldKey,
      body: Container(
        child: Center(
          child: loginform,
        ),
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        doLogin(_username, _password);
      });
    }
  }

  doLogin(String username, String password) {
    api
        .login(username, password)
        .then((user) => onLoginSuccess(user))
        .catchError((onError) => onLoginError(onError.toString()));
  }

  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
    });
    var db = new DataBaseHelper();
    await db.saveUser(user);
    Navigator.of(context).pushNamed("/quiz");
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }
}
