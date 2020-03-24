import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false,
  };

  @override
  Widget build(BuildContext context) {
    final targetWidth = MediaQuery.of(context).size.width > 768
        ? 500
        : MediaQuery.of(context).size.width * .95;
    return Scaffold(
      appBar: AppBar(
        title: Text('Plase login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildEmailInputTextField(),
                    SizedBox(
                      height: 10,
                    ),
                    buildPasswordInputTextField(),
                    SizedBox(
                      height: 10,
                    ),
                    buildAcceptTermsSwitchListTile(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Fill'),
                          onPressed: () {
                            setState(() {
                              _formData['acceptTerms'] = true;
                              _formData['email'] = 'test@test.com';
                              _formData['password'] = '123456789';
                            });

                            print("esta es una prueba ${_formData['email']}");
                          },
                        ),
                        RaisedButton(
                          child: Text('LOGIN'),
                          onPressed: () {
                            if (_formKey.currentState.validate() &&
                                _formData['acceptTerms'] == true) {
                              _formKey.currentState.save();
                              print('email: ' + _formData['email']);
                              Navigator.pushReplacementNamed(context, '/admin');
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SwitchListTile buildAcceptTermsSwitchListTile() {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      title: Text('Accept terms'),
      onChanged: (bool val) {
        print('changed' + val.toString());
        setState(() {
          _formData['acceptTerms'] = val;
        });
      },
    );
  }

  TextFormField buildPasswordInputTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Password must be at leats 5 characters.';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  TextFormField buildEmailInputTextField() {
    return TextFormField(
      autovalidate: true,
      validator: (String value) {
        if (value != null && value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Description is Required an should be 10+ characters long.';
        }
        return '';
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: 'Email',
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      initialValue: _formData['email'],
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }
}
