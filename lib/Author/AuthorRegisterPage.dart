import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorRegisterPage extends StatefulWidget {
  const AuthorRegisterPage({Key? key}) : super(key: key);

  @override
  State<AuthorRegisterPage> createState() => _AuthorRegisterPageState();
}

class _AuthorRegisterPageState extends State<AuthorRegisterPage> {


  final valkey=GlobalKey<FormState>();
  static TextEditingController _fnm=TextEditingController();
  static TextEditingController _lnm=TextEditingController();
  static TextEditingController _phn=TextEditingController();
  static TextEditingController _eml=TextEditingController();
  static TextEditingController _ps=TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'Author Register',
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
                        controller:_fnm,
                        validator: (val){
                          if(val!.isEmpty) return "Please Enter First Name";
                          else if(!RegExp(r'^[a-zA-Z]+$').hasMatch(val)){return "Please Enter Characters Only";}
                          else {
                            return null;
                          }
                        },
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 15.0
                            )
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: "Enter First Name",
                            labelText: "First Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        controller:_lnm,
                        validator: (val){
                          if(val!.isEmpty ) return "Please Enter Last Name";
                          else if(!RegExp(r'^[a-zA-Z]+$').hasMatch(val)){return "Please Enter Characters Only";}
                          else {
                            return null;
                          }
                        },
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 15.0
                            )
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: "Enter Last Name",
                            labelText: "Last Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        controller:_phn,
                        validator: (val){
                          if(val!.isEmpty){ return "Please Enter Phone Number";}
                          else if(val.length < 10 || val.length >10 ){return "Please Enter Proper Phone Number";}
                          else if( RegExp(r'^[0-9]+$').hasMatch(val)){return "Please Enter Digits";}
                          else {
                            return null;
                          }
                        },
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 15.0
                            )
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_android_outlined),
                            hintText: "Enter Phone Number",
                            labelText: "Phone Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        controller:_eml,
                        validator: (val){
                          if(val!.isEmpty) {return "Please Enter E-mail";}
                          else if(RegExp(r'^[a-zA-Z0-9]+$').hasMatch(val)){ return "Please Enter proper Email";}
                          else {
                            return null;
                          }
                        },
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 15.0
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
                        controller:_ps,
                        validator: (val){
                          if(val!.isEmpty) return "Please Enter Password";
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
                      RaisedButton(
                        onPressed: (){
                          if(valkey.currentState!.validate()) {
                            Navigator.of(context).pop();
                          }
                        },
                        color: Colors.red[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("Register",
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
                            "Already Registered ?",
                            style: GoogleFonts.josefinSans(
                              textStyle:TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Login here",
                              style: GoogleFonts.josefinSans(
                                textStyle:TextStyle(
                                    fontSize: 15,
                                    decoration:TextDecoration.underline,
                                    color: Colors.blue
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,)
                        ],
                      )
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
