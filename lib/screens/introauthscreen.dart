import 'package:belegdb/authentication/navigateauthscreen.dart';
import 'package:belegdb/variables.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroAuthScreen extends StatefulWidget {
  const IntroAuthScreen({Key? key}) : super(key: key);

  @override
  State<IntroAuthScreen> createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Herzlich willkommen",
            body: "Welcome to Chat App, for video conference",
            image: Center(
              child: Image.asset('images/welcome.png', height: 175),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black),
            )),
        PageViewModel(
            title: "Join or start Metings",
            body: "Easy to use",
            image: Center(
              child: Image.asset('images/conference.jpg', height: 175),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black),
            )),
        PageViewModel(
          title: "Security",
          body: "Our servers are secures",
          image: Center(
            child: Image.asset('images/secure.jpg', height: 175),
          ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          ),
        ),
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigateAuthscreen()));
      },
      onSkip: () {},
      showSkipButton: true,
      skip: const Icon(
        Icons.skip_next,
        size: 45,
      ),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(
        "Done",
        style: mystyle(20, Colors.black),
      ),
    );
  }
}
