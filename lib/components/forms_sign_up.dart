import 'dart:convert';

import 'package:find_the_spy/models/user.dart';
import 'package:find_the_spy/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values/preferences_keys.dart';

class FormsSignUp extends StatefulWidget {
  const FormsSignUp({Key? key}) : super(key: key);

  @override
  State<FormsSignUp> createState() => _FormsSignUpState();
}

class _FormsSignUpState extends State<FormsSignUp> {
  bool showPassword = false;
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passswordInputController = TextEditingController();
  TextEditingController _confirmPasswordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _nameInputController,
            decoration: InputDecoration(
              labelText: 'Nome Completo',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: _emailInputController,
            decoration: InputDecoration(
              labelText: 'E-Mail',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                Icons.mail_outline,
                color: Colors.white,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: _passswordInputController,
            obscureText: (this.showPassword == true) ? false : true,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                Icons.key,
                color: Colors.white,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: _confirmPasswordInputController,
            obscureText: (this.showPassword == true) ? false : true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                Icons.key,
                color: Colors.white,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 12)),
          Row(
            children: [
              Checkbox(
                value: this.showPassword,
                onChanged: (var newValue) {
                  setState(() {
                    this.showPassword = newValue!;
                    print(this.showPassword);
                  });
                },
              ),
              Text(
                'Show Passwords?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 32)),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                _doSignUp();
                Navigator.pushNamed(context, SignUpScreen.id);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _doSignUp() {
    User newUser = User(
      name: _nameInputController.text,
      mail: _emailInputController.text,
      password: _passswordInputController.text,
      keepOn: true,
    );
    print(newUser);
    _saveUser(newUser);
  }

  void _saveUser(User user) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }
}
