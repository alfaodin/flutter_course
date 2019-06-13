import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _email;
  String _password;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plase login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _acceptTerms,
                    title: Text('Accept terms'),
                    onChanged: (bool val) {
                      print('changed' + val.toString());

                      setState(() {
                        _acceptTerms = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text('LOGIN'),
                    onPressed: () {
                      print('email $_email');
                      Navigator.pushReplacementNamed(context, '/admin');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
