import 'dart:io';

import 'package:e_pustakalay/Model/BookModal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorHomePage extends StatefulWidget {
  final List<Book> books;
  const AuthorHomePage({Key? key, required this.books}) : super(key: key);

  @override
  State<AuthorHomePage> createState() => _AuthorHomePageState();
}

class _AuthorHomePageState extends State<AuthorHomePage> {
  @override
  Widget build(BuildContext context) {

    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: Text("Author Home Page"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            //UserAccountsDrawerHeader(accountName: Text("user"), accountEmail: Text("email"),currentAccountPicture: Image.asset('assets/images/read.png'),),
            InkWell(
              onTap: (){},
              child: Container(
                height: h/2.8,
                width: w,
                color: Colors.red,
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: Icon(Icons.close),),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/read.png'),
                      radius: 48,
                    ),
                    SizedBox(height: 10,),
                    Text("user",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("email",style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
            ),
            Container(
              height: h/1.7,
              width: w,
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Favorites'),
                    leading: Icon(Icons.favorite_border,color: Colors.red,),
                  ),
                  ListTile(
                    title: Text('Reading Done'),
                    leading: Icon(Icons.done_all,color: Colors.red,),
                  ),
                  ListTile(title: Text('Profile'),
                    leading: Icon(Icons.person_outline,color: Colors.red,),),
                  ListTile(title: Text('Setting'),
                    leading: Icon(Icons.settings,color: Colors.black,),),
                  ListTile(title: Text('Log Out'),
                    leading: Icon(Icons.logout,color: Colors.black,),
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed("/select");
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: h/20,
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/book.png',height: 35,width: 35,),
                  SizedBox(width: 10.0,),
                  Text(
                    "E-Pushtakalay",
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WillPopScope(child: Container(), onWillPop: (){
                exit(0);
              }),
              Text(widget.books.toString())
            ],
          ),
        ),
      ),
    );
  }
}
