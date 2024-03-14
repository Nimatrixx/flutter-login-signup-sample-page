import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_auth/components/rounded_button.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  bool showButtons = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      lowerBound: 0.5,
      upperBound: 1,
      value: 1,
    );

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showButtons = true;
        controller.reverse();
      });
    });

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFEFF2F1),
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.35 * controller.value),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: 'icon',
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * (0.2 + controller.value / 10),
                      child: Image(
                        image: AssetImage('images/programming.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'BeCoder',
                          textStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: size.height * 0.05,
                            fontFamily: 'Satoshi',
                          ),
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.4 * (1 - controller.value)),
              if (showButtons)
                Hero(
                  tag: 'login',
                  child: RoundedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          CustomPageRoute(builder: (context) => LoginScreen()));
                    },
                    width: size.width * 0.8 * 2 * (1 - controller.value),
                    height: size.height * 0.08,
                    color: Colors.deepPurple[200],
                    text: 'Login',
                    textColor: Colors.deepPurple[900],
                  ),
                ),
              if (showButtons)
                RoundedButton(
                  onPressed: () {},
                  width: size.width * 0.8 * 2 * (1 - controller.value),
                  height: size.height * 0.08,
                  color: Colors.deepPurple[400],
                  text: 'Sign Up',
                  textColor: Colors.deepPurple[50],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  CustomPageRoute({builder}) : super(builder: builder);
}
