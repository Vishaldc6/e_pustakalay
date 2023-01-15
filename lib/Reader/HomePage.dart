import 'dart:convert';
import 'dart:io';

import 'package:e_pustakalay/Model/BookModal.dart';
import 'package:e_pustakalay/Reader/AuthorPage.dart';
import 'package:e_pustakalay/Reader/SubjectPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  //final List<Book> books;
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(widget.books);
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   loadData();
  // }
  //
  // loadData() async{
  //   final datafile=await rootBundle.loadString('assets/json/bookData.json');
  //   final data=jsonDecode(datafile);
  //   print(data['result']);
  //
  //   final result=data['result'];
  //
  //   books=List.from(result).map<Book>((e) => Book.fromMap(e)).toList();
  //
  //   print(books[1]);
  //
  //
  // }


  @override
  Widget build(BuildContext context) {

    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;


    Widget ttl = Row(
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
    );
    Icon src = Icon(Icons.search);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,
        elevation: 1.0,
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  if(src.icon==Icons.search){
                    src=Icon(Icons.close);
                    ttl=TextField(
                      decoration: InputDecoration(
                        hintText: "search here"
                      ),
                      onChanged: (text){
                        text=text.toLowerCase();

                      },
                    );
                  }
                });
              },
              icon:src
          )
        ],
        title: ttl,
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
                    Text("Vishal",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("vishal@gmail.com",style: TextStyle(fontSize: 16),),
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
      body: Container(
        color: Colors.grey[300],
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WillPopScope(child: Container(), onWillPop: (){
                  exit(0);
                }),
                Container(
                  height: h/4,
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),

                ),
                SizedBox(height: 10.0,),
                Text(
                  "New Releases",
                  style: GoogleFonts.josefinSans(
                    textStyle:TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      decoration:TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: h/4.5,
                  width: w,
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: 5 ,
                  //     itemBuilder: (context, index) => BookCard(widget.books[index])),
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subjects",
                      style: GoogleFonts.josefinSans(
                        textStyle:TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration:TextDecoration.underline,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectPage(book:widget.books)));
                      },
                      child: Text(
                        "see more",
                        style: GoogleFonts.josefinSans(
                          textStyle:TextStyle(
                              fontSize: 20,
                              decoration:TextDecoration.underline,
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: h/10,
                  width: w,
                  // child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: widget.books.length,
                  //     itemBuilder: (context, index) => SubjectCard(widget.books[index])),
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Authors",
                      style: GoogleFonts.josefinSans(
                        textStyle:TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration:TextDecoration.underline,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthorPage(book: widget.books)));
                      },
                      child: Text(
                        "see more",
                        style: GoogleFonts.josefinSans(
                          textStyle:TextStyle(
                              fontSize: 20,
                              decoration:TextDecoration.underline,
                              color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: h/6,
                  width: w,
                  // child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: widget.books.length,
                  //     itemBuilder: (context, index) => AuthorCard(widget.books[index])),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget BookCard(Book book) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(image: NetworkImage(book.img),fit: BoxFit.fill)
      ),
      child: Container(
          padding: EdgeInsets.all(2.0), height:40, width:100,
          decoration: BoxDecoration(
            color:Colors.grey[200],
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))),
          child: Text(book.title,
              style: GoogleFonts.josefinSans(textStyle:TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500,),),
              maxLines: 2,
              overflow: TextOverflow.ellipsis)
      ),
      height: 100, width: 100,
    ),
  );
}

Widget SubjectCard(Book book) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.grey),
      child: Text( book.subject.toString(),
          style: GoogleFonts.josefinSans(textStyle:TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500,),),
      ),
      width: 120,
    ),
  );
}


Widget AuthorCard(Book book) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
              color: Colors.grey,
            image: DecorationImage(image: AssetImage('assets/images/author.png'),fit: BoxFit.contain)
          ),
          height: 80,
          width: 80,
        ),
         Text( book.author.toString(),
          style: GoogleFonts.josefinSans(textStyle:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500,),),
        ),
      ],
    ),
  );
}
