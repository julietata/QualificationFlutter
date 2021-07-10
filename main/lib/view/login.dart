import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/utils/globals.dart' as globals;
import 'package:main/view/navigationbar.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var _ctrlUsername = TextEditingController();
  var _ctrlPass = TextEditingController();
  var _ctrlEmail = TextEditingController();
  var _usernameError = false;
  var _usernameMsg = '';
  var _emailError = false;
  var _emailMsg = '';
  var _passError = false;
  var _passMsg = '';
  var msg = "";

  void _onPressed(BuildContext ctx) {
    if (_ctrlUsername.text.isEmpty) {
      setState(() {
        _usernameError = true;
        _usernameMsg = 'Username must be filled!';
      });
    }
    else if (_ctrlUsername.text.length < 6) {
      setState(() {
        _usernameError = true;
        _usernameMsg = 'Username must be more than 5 characters!';
      });
    }
    else {
      _usernameError = false;
    }
    if (_ctrlEmail.text.isEmpty) {
      setState(() {
        _emailError = true;
        _emailMsg = 'Email must be filled!';
      });
    }
    else if (!_ctrlEmail.text.contains("@") ||
        !_ctrlEmail.text.endsWith(".com")) {
          setState(() {
            _emailError = true;
            _emailMsg = 'Wrong Email Format!';
          });
    } 
    else {
      _emailError = false;
    }
    if (_ctrlPass.text.isEmpty) {
      setState(() {
        _passError = true;
        _passMsg = 'Password must be filled!';
      });
    }
    else {
      _passError = false;
    }
    if (_usernameError == false && _emailError == false && _passError == false) {
      globals.username = _ctrlUsername.text;
      Navigator.push(ctx, MaterialPageRoute(builder: (builder) {
      return Navigation();
    }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
      child: Column(
        children: [
          Image(image: AssetImage('./assets/icon.png'), height: 150, width: 300),
          Text('Login',
              style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  fontSize: 30)),
          TextField(
            decoration: InputDecoration(
                hintText: 'Username', contentPadding: const EdgeInsets.all(10), errorText: _usernameError? _usernameMsg : ""),
            controller: _ctrlUsername,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Email', contentPadding: const EdgeInsets.all(10), errorText: _emailError? _emailMsg : ""),
            controller: _ctrlEmail,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password', contentPadding: const EdgeInsets.all(10), errorText: _passError? _passMsg : ""),
            controller: _ctrlPass,
          ),
          Padding(padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
          child: ElevatedButton(
              onPressed: () => _onPressed(context),
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0))))
        ]
      ),
    )
    )
    );
  }
}
