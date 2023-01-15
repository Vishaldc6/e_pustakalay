import 'dart:convert';

import 'package:e_pustakalay/Model/BookModal.dart';
import 'package:e_pustakalay/Reader/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AuthorHomePage.dart';


class AuthorLoginPage extends StatefulWidget {
  const AuthorLoginPage({Key? key}) : super(key: key);
  @override
  State<AuthorLoginPage> createState() => _AuthorLoginPageState();
}

class _AuthorLoginPageState extends State<AuthorLoginPage> {

  final valkey=GlobalKey<FormState>();
  static TextEditingController _eml=TextEditingController();
  static TextEditingController _ps=TextEditingController();

  List<Book> books=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
    final datafile=await rootBundle.loadString('assets/json/bookData.json');
    final data=jsonDecode(datafile);
    print(data['result']);
    final result=data['result'];
    books=List.from(result).map<Book>((e) => Book.fromMap(e)).toList();
    print(books[1]);
  }


  @override
  Widget build(BuildContext context) {

    var h=MediaQuery.of(context).size.height;



    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0,),
              Image.asset('assets/images/book.png',height: 60,width: 60,),
              SizedBox(height: 10.0,),
              Text(
                'E-Pustakalay',
                style: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'Author Login',
                style: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Form(
                  key: valkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _eml,
                        validator: (val){
                          if(val!.isEmpty) return "Please Enter E-mail";
                        },
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 18.0
                            )
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email_outlined),
                            hintText: "Enter E-mail",
                            labelText: "E-mail",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        controller: _ps,
                        validator: (val){
                          if(val!.isEmpty){return "Please Enter Password";}
                          else if(val.length < 6){return "Password Length atleast 6";}
                          else{ return null;}
                        },
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 15.0
                            )
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: "Enter Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed("/forgot");
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: GoogleFonts.josefinSans(
                            textStyle:TextStyle(
                                fontSize: 15,
                                decoration:TextDecoration.underline,
                                color: Colors.blue
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      RaisedButton(
                        onPressed: (){
                          if(valkey.currentState!.validate()) {

                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AuthorHomePage(books: books)));
                          }
                        },
                        color: Colors.red[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("Login",
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w500,
                            textStyle:TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "New Author ?",
                            style: GoogleFonts.josefinSans(
                              textStyle:TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed("/authorregister");
                            },
                            child: Text(
                              "Register here",
                              style: GoogleFonts.josefinSans(
                                textStyle:TextStyle(
                                    fontSize: 15,
                                    decoration:TextDecoration.underline,
                                    color: Colors.blue
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
