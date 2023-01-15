
import 'package:e_pustakalay/Author/AuthorForgotPasswordPage.dart';
import 'package:e_pustakalay/Author/AuthorHomePage.dart';
import 'package:e_pustakalay/Author/AuthorLoginPage.dart';
import 'package:e_pustakalay/Author/AuthorRegisterPage.dart';
import 'package:flutter/material.dart';

import 'Reader/AuthorPage.dart';
import 'Reader/ForgotPasswordPage.dart';
import 'Reader/HomePage.dart';
import 'Reader/LoginPage.dart';
import 'Reader/RegisterPage.dart';
import 'SelectionPage.dart';
import 'Reader/SubjectPage.dart';
import 'SplashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginPage(),
        '/authorlogin': (context) => AuthorLoginPage(),
        '/select': (context) => SelectionPage(),
        '/forgot': (context) => ForgotPasswordPage(),
        '/authorforgot': (context) => AuthorForgotPasswordPage(),
        '/register': (context) => RegisterPage(),
        '/authorregister': (context) => AuthorRegisterPage(),
        '/home': (context) =>  HomePage(),
        '/authorhome':(context)=>AuthorHomePage(books: []),
        '/subject': (context) => SubjectPage(book: [],),
        '/author': (context) => AuthorPage(book: [],),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashPage(),
    );
  }
}
