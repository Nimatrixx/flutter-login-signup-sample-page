import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: size.height * 0.4 * (1 - controller.value)),
                  if (showButtons)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        color: Colors.deepPurple[200],
                        borderRadius: BorderRadius.circular(8.0),
                        elevation: 8.0,
                        child: MaterialButton(
                          minWidth:
                              size.width * 0.8 * 2 * (1 - controller.value),
                          height: size.height * 0.08,
                          onPressed: () {},
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              color: Colors.deepPurple[900],
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (showButtons)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(8.0),
                        elevation: 8.0,
                        child: MaterialButton(
                          minWidth:
                              size.width * 0.8 * 2 * (1 - controller.value),
                          height: size.height * 0.08,
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              color: Colors.deepPurple[50],
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
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
  Duration get transitionDuration => const Duration(seconds: 2);

  CustomPageRoute({builder}) : super(builder: builder);
}

// void navigate() async {
//     await Future.delayed(Duration(seconds: 2));
//     Navigator.of(context).push(
//       CustomPageRoute(
//         builder: (context) => AuthScreen(),
//       ),
//     );
//   }