import 'package:fitso2/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/fitso_logo.jpg',
                  height: 160.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: <Widget>[
                  TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)
                ) 
              ),
              onSaved: (input) => _email = input,
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              validator: (input) {
                if(input.length < 6){
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)
                ) 
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign in'),
            ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  
  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }
}


