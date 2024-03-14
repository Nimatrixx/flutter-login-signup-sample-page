import 'package:flutter/material.dart';
import 'package:flutter_auth/components/custom_text_field.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFEFF2F1),
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
            SizedBox(height: 50.0),
            CustomTextField(
              width: size.width * 0.8,
              hint: 'Email',
              onChanged: (v) {},
            ),
            Hero(
              tag: 'signup',
              child: RoundedButton(
                onPressed: () {},
                width: size.width * 0.8,
                height: size.height * 0.08,
                color: Colors.deepPurple[200],
                text: 'Next',
                textColor: Colors.deepPurple[900],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(fontFamily: 'Satoshi'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Login',
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
