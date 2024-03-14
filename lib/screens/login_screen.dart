import 'package:flutter/material.dart';
import 'package:flutter_auth/components/custom_text_field.dart';
import 'package:flutter_auth/components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: size.height * 0.2),
            Hero(
              tag: 'icon',
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                    child: Image(
                      image: AssetImage('images/programming.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: size.height * 0.05,
                      fontFamily: 'Satoshi',
                    ),
                    child: Text('BeCoder'),
                  ),
                ],
              ),
            ),
            CustomTextField(
              width: size.width * 0.8,
              hint: 'Username',
              onChanged: (v) {},
            ),
            CustomTextField(
              width: size.width * 0.8,
              hint: 'Password',
              password: true,
              onChanged: (v) {},
              padding: EdgeInsets.only(top: 8.0),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.38, bottom: 20.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'I forgot my password',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'login',
              child: RoundedButton(
                onPressed: () {},
                width: size.width * 0.8,
                height: size.height * 0.08,
                color: Colors.deepPurple[200],
                text: 'Login',
                textColor: Colors.deepPurple[900],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account yet?',
                  style: TextStyle(fontFamily: 'Satoshi'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
