import 'dart:async';

import 'package:e_pustakalay/Reader/LoginPage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(milliseconds: 2500), (){
        Navigator.of(context).pushReplacementNamed("/select");
    });
  }



  @override
  Widget build(BuildContext context) {

    var h=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/book.png',height: 100,width: 100,),
            SizedBox(height: 20.0,),
            Text(
              'E-Pustakalay',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}
